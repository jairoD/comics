import 'package:comics/models/request_model.dart';
import 'package:comics/models/response_model.dart';
import 'package:comics/services/http_service.dart';

class IssuesRepository {
  final HttpService _httpService = HttpService();

  Future<ResponseModel?> getIssues(int page) {
    return _httpService.get(RequestModel(
        path: '/api/issues', queryParams: {'offset': '${(page - 1) * 10}'}));
  }

  Future<ResponseModel?> getIssueDetails(int id) {
    return _httpService.get(RequestModel(path: '/api/issue/4000-$id'));
  }

  Future<ResponseModel?> getExtraData(String route, int code, int id) {
    return _httpService.get(RequestModel(path: '/api/$route/$code-$id'));
  }
}
