class Notifi {
  final int not_id;
  final String body;
  final String category;
  final String seen;
  final String? description;

  const Notifi({
    required this.not_id,
    required this.body,
    required this.seen,
    required this.category,
    this.description,
  });

  static Notifi fromJson(json) => Notifi(
      not_id: json['not_id'],
      body: json['body'],
      seen: json['seen'],
      category: json['category'],
      description: json['description'] ?? null);
}
