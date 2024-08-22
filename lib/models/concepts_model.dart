class ConceptCredit {
  final int id;
  final String name;
  final String apiDetailUrl;
  final String siteDetailUrl;

  ConceptCredit({
    required this.id,
    required this.name,
    required this.apiDetailUrl,
    required this.siteDetailUrl,
  });

  factory ConceptCredit.fromJson(Map<String, dynamic> json) {
    return ConceptCredit(
      id: json['id'] as int,
      name: json['name'] as String,
      apiDetailUrl: json['api_detail_url'] as String,
      siteDetailUrl: json['site_detail_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'api_detail_url': apiDetailUrl,
      'site_detail_url': siteDetailUrl,
    };
  }
}
