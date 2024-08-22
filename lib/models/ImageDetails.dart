class ImageDetails {
  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;
  final String screenLargeUrl;
  final String smallUrl;
  final String superUrl;
  final String thumbUrl;
  final String tinyUrl;
  final String originalUrl;
  final String imageTags;

  ImageDetails({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      iconUrl: json['icon_url'],
      mediumUrl: json['medium_url'],
      screenUrl: json['screen_url'],
      screenLargeUrl: json['screen_large_url'],
      smallUrl: json['small_url'],
      superUrl: json['super_url'],
      thumbUrl: json['thumb_url'],
      tinyUrl: json['tiny_url'],
      originalUrl: json['original_url'],
      imageTags: json['image_tags'],
    );
  }
}
