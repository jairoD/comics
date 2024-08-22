// ignore_for_file: public_member_api_docs, sort_constructors_first
class IssuesEvents {}

class IssuesFechEvent extends IssuesEvents {}

class IssuesFechDetailEvent extends IssuesEvents {
  int id;
  IssuesFechDetailEvent({
    required this.id,
  });
}
