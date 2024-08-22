import 'package:comics/blocs/issues_events.dart';
import 'package:comics/blocs/issues_state.dart';
import 'package:comics/models/issue_details.dart';
import 'package:comics/models/issue_model.dart';
import 'package:comics/models/response_api_model.dart';
import 'package:comics/models/response_model.dart';
import 'package:comics/repositories/issues_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuesBloc extends Bloc<IssuesEvents, IssuesState> {
  final IssuesRepository _issuesRepository;

  IssuesBloc(this._issuesRepository) : super(IssuesState()) {
    on<IssuesFechEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        ResponseModel? response = await _issuesRepository.getIssues(state.page);
        ResponseApiModel responseApiModel =
            ResponseApiModel.fromMap(response!.data);
        List<dynamic> data = responseApiModel.results;
        emit(state.copyWith(
            fetchStatus: IssuesStatus.success,
            isLoading: false,
            page: state.page + 1,
            issues: List.of(state.issues)
              ..addAll(data.map((e) => Issue.fromJson(e)).toList()),
            totalResults: responseApiModel.numberOfTotalRresults));
      } catch (e) {
        emit(state.copyWith(
            isLoading: false, fetchStatus: IssuesStatus.failure));
      }
    });
    on<IssuesFechDetailEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true, issueDetails: null));
        ResponseModel? response =
            await _issuesRepository.getIssueDetails(event.id);
        ResponseApiModel responseApiModel =
            ResponseApiModel.fromMap(response!.data);
        dynamic data = responseApiModel.results;
        emit(state.copyWith(
            fetchStatus: IssuesStatus.success,
            isLoading: false,
            issueDetails: IssueDetails.fromJson(data)));
      } catch (e) {
        emit(state.copyWith(
            isLoading: false, fetchStatus: IssuesStatus.failure));
      }
    });
  }
}
