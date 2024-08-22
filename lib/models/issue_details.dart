import 'package:comics/models/ImageDetails.dart';
import 'package:comics/models/characters_model.dart';
import 'package:comics/models/concepts_model.dart';
import 'package:comics/models/location_model.dart';
import 'package:comics/models/person_model.dart';
import 'package:comics/models/team_model.dart';
import 'package:comics/models/volume.dart';

class IssueDetails {
  final int id;
  final String apiDetailUrl;
  final String name;
  final String issueNumber;
  final String description;
  final String coverDate;
  final String siteDetailUrl;
  final String storeDate;
  final List<CharacterCredit> characterCredits;
  final List<ConceptCredit> conceptCredits;
  final List<LocationCredit> locationCredits;
  final List<PersonCredit> personCredits;
  final List<TeamCredit> teamCredits;
  final ImageDetails image;
  final Volume volume;
  IssueDetails({
    required this.id,
    required this.apiDetailUrl,
    required this.name,
    required this.issueNumber,
    required this.description,
    required this.coverDate,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.characterCredits,
    required this.conceptCredits,
    required this.locationCredits,
    required this.personCredits,
    required this.teamCredits,
    required this.image,
    required this.volume,
  });

  // Factory method to create an Issue from a JSON object
  factory IssueDetails.fromJson(Map<String, dynamic> json) {
    return IssueDetails(
      id: json['id'] as int,
      apiDetailUrl: json['api_detail_url'] as String,
      name: json['name'] as String? ?? '',
      issueNumber: json['issue_number'] as String,
      description: json['description'] as String? ?? '',
      coverDate: json['cover_date'] as String? ?? '',
      siteDetailUrl: json['site_detail_url'] as String,
      storeDate: json['store_date'] as String? ?? '',
      characterCredits: (json['character_credits'] as List<dynamic>)
          .map((e) => CharacterCredit.fromJson(e))
          .toList(),
      conceptCredits: (json['concept_credits'] as List<dynamic>)
          .map((e) => ConceptCredit.fromJson(e))
          .toList(),
      locationCredits: (json['location_credits'] as List<dynamic>)
          .map((e) => LocationCredit.fromJson(e))
          .toList(),
      personCredits: (json['person_credits'] as List<dynamic>)
          .map((e) => PersonCredit.fromJson(e))
          .toList(),
      teamCredits: (json['team_credits'] as List<dynamic>)
          .map((e) => TeamCredit.fromJson(e))
          .toList(),
      image: ImageDetails.fromJson(json['image']),
      volume: Volume.fromJson(json['volume']),
    );
  }
}
