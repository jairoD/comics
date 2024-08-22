class PersonCredit {
  final int id;
  final String name;
  final String role;
  final String apiDetailUrl;
  final String siteDetailUrl;

  PersonCredit({
    required this.id,
    required this.name,
    required this.role,
    required this.apiDetailUrl,
    required this.siteDetailUrl,
  });

  factory PersonCredit.fromJson(Map<String, dynamic> json) {
    return PersonCredit(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      apiDetailUrl: json['api_detail_url'] as String,
      siteDetailUrl: json['site_detail_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'api_detail_url': apiDetailUrl,
      'site_detail_url': siteDetailUrl,
    };
  }
}
