class Volume {
  final String apiDetailUrl;
  final int id;
  final String name;
  final String siteDetailUrl;

  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      apiDetailUrl: json['api_detail_url'],
      id: json['id'],
      name: json['name'],
      siteDetailUrl: json['site_detail_url'],
    );
  }
}
