// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comics/models/issue_details.dart';
import 'package:comics/models/issue_model.dart';

enum IssuesStatus { success, failure }

class IssuesState {
  List<Issue> issues;
  IssuesStatus? fetchStatus;
  IssueDetails? issueDetails;
  int page;
  int totalResults;
  bool isLoading;

  IssuesState(
      {this.issues = const <Issue>[],
      this.page = 1,
      this.totalResults = 0,
      this.issueDetails,
      this.fetchStatus,
      this.isLoading = false});

  IssuesState copyWith(
      {List<Issue>? issues,
      IssueDetails? issueDetails,
      IssuesStatus? fetchStatus,
      int? page,
      int? totalResults,
      bool? isLoading}) {
    return IssuesState(
        issues: issues ?? this.issues,
        issueDetails: issueDetails ?? this.issueDetails,
        fetchStatus: fetchStatus ?? this.fetchStatus,
        page: page ?? this.page,
        totalResults: totalResults ?? this.totalResults,
        isLoading: isLoading ?? this.isLoading);
  }
}
