import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:comics/models/request_model.dart';
import 'package:comics/models/response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class HttpService {
  final client = Client();
  final _baseUrl = dotenv.env['API_URL'];
  final _apiKey = dotenv.env['API_KEY'];

  HttpService();

  getMethod(HTTPMethods method) {
    switch (method) {
      case HTTPMethods.get:
        return client.get;
      case HTTPMethods.post:
        return client.post;
      case HTTPMethods.put:
        return client.put;
      case HTTPMethods.delete:
        return client.delete;
      default:
    }
  }

  Future<ResponseModel?> get(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.get));
  }

  Future<ResponseModel?> post(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.post));
  }

  Future<ResponseModel?> put(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.put));
  }

  Future<ResponseModel?> del(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.delete));
  }

  Future<ResponseModel> sendRequest(RequestModel req) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        //'x-api-key': _apiKey!
      };
      Map<String, String> queryParams = {
        'format': 'json',
        'api_key': _apiKey!,
        'limit': '10',
        'sort': 'cover_date:desc'
      };
      if (req.queryParams != null) queryParams.addAll(req.queryParams!);
      if (req.headers != null) headers.addAll(req.headers!);
      Function method = getMethod(req.method!);
      Response response;
      if (req.body != null) {
        response = await method(
            Uri.http(_baseUrl!, req.path ?? '', queryParams),
            headers: headers,
            body: jsonEncode(req.body));
      } else {
        response = await method(
            Uri.http(_baseUrl!, req.path ?? '', queryParams),
            headers: headers);
      }
      return ResponseModel(
          data: jsonDecode(response.body),
          message: response.reasonPhrase,
          statusCode: response.statusCode,
          succes: (response.statusCode >= 200 && response.statusCode <= 299));
    } on HttpException catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } on ClientException catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } on SocketException catch (e) {
      return ResponseModel(
          data: null,
          message: e.message,
          statusCode: e.osError?.errorCode ?? 404,
          succes: false);
    } on TimeoutException catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } on Exception catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 408, succes: false);
    }
  }
}
