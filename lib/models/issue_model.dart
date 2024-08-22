import 'package:comics/models/ImageDetails.dart';
import 'package:comics/models/associated_image.dart';
import 'package:comics/models/volume.dart';

class Issue {
  final String? aliases;
  final String? apiDetailUrl;
  final String? coverDate;
  final String? dateAdded;
  final String? dateLastUpdated;
  final String? deck;
  final String? description;
  final bool hasStaffReview;
  final int id;
  final ImageDetails image;
  final List<AssociatedImage> associatedImages;
  final String? issueNumber;
  final String? name;
  final String? siteDetailUrl;
  final Volume volume;
  final String? storeDate;

  Issue(
      {required this.aliases,
      required this.apiDetailUrl,
      required this.coverDate,
      required this.dateAdded,
      required this.dateLastUpdated,
      required this.deck,
      required this.description,
      required this.hasStaffReview,
      required this.id,
      required this.image,
      required this.associatedImages,
      required this.issueNumber,
      required this.name,
      required this.siteDetailUrl,
      required this.volume,
      required this.storeDate});

  factory Issue.fromJson(Map<String, dynamic> json) {
    var associatedImagesFromJson = json['associated_images'] as List;
    List<AssociatedImage> associatedImagesList = associatedImagesFromJson
        .map((image) => AssociatedImage.fromJson(image))
        .toList();

    return Issue(
        aliases: json['aliases'],
        apiDetailUrl: json['api_detail_url'],
        coverDate: json['cover_date'],
        dateAdded: json['date_added'],
        dateLastUpdated: json['date_last_updated'],
        deck: json['deck'],
        description: json['description'],
        hasStaffReview: json['has_staff_review'],
        id: json['id'],
        image: ImageDetails.fromJson(json['image']),
        associatedImages: associatedImagesList,
        issueNumber: json['issue_number'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
        volume: Volume.fromJson(json['volume']),
        storeDate: json['store_date']);
  }
}
