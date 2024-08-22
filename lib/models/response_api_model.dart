// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseApiModel {
  int limit;
  int offset;
  int numberOfPageRresults;
  int numberOfTotalRresults;
  dynamic results;
  ResponseApiModel({
    required this.limit,
    required this.offset,
    required this.numberOfPageRresults,
    required this.numberOfTotalRresults,
    required this.results,
  });

  ResponseApiModel copyWith({
    int? limit,
    int? offset,
    int? numberOfPageRresults,
    int? numberOfTotalRresults,
    dynamic? results,
  }) {
    return ResponseApiModel(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      numberOfPageRresults: numberOfPageRresults ?? this.numberOfPageRresults,
      numberOfTotalRresults:
          numberOfTotalRresults ?? this.numberOfTotalRresults,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'limit': limit,
      'offset': offset,
      'number_of_page_results': numberOfPageRresults,
      'number_of_total_results': numberOfTotalRresults,
      'results': results,
    };
  }

  factory ResponseApiModel.fromMap(Map<String, dynamic> map) {
    return ResponseApiModel(
      limit: (map['limit'] ?? 0) as int,
      offset: (map['offset'] ?? 0) as int,
      numberOfPageRresults: (map['number_of_page_results'] ?? 0) as int,
      numberOfTotalRresults: (map['number_of_total_results'] ?? 0) as int,
      results: map['results'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseApiModel.fromJson(String source) =>
      ResponseApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseApiModel(limit: $limit, offset: $offset, number_of_page_results: $numberOfPageRresults, number_of_total_results: $numberOfTotalRresults, results: $results)';
  }

  @override
  bool operator ==(covariant ResponseApiModel other) {
    if (identical(this, other)) return true;

    return other.limit == limit &&
        other.offset == offset &&
        other.numberOfPageRresults == numberOfPageRresults &&
        other.numberOfTotalRresults == numberOfTotalRresults &&
        other.results == results;
  }

  @override
  int get hashCode {
    return limit.hashCode ^
        offset.hashCode ^
        numberOfPageRresults.hashCode ^
        numberOfTotalRresults.hashCode ^
        results.hashCode;
  }
}
