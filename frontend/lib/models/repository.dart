class Repository {

  final String name;
  final String url;
  final String description;
  final String icon;
  final bool trusted;
  final String indexType;

  Repository({
    required this.name,
    required this.url,
    required this.description,
    required this.icon,
    required this.trusted,
    required this.indexType,
  });


  factory Repository.fromJson(Map<String, dynamic> json) {

    return Repository(

      name: json["name"] ?? "",
      url: json["url"] ?? "",
      description: json["description"] ?? "",
      icon: json["icon"] ?? "",
      trusted: json["trusted"] ?? false,
      indexType: json["indexType"] ?? "unknown",

    );

  }
}