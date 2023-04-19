class Notifi {
  final int not_id;
  final String body;
  final String category;
  final String? description;

  const Notifi({
    required this.not_id,
    required this.body,
    required this.category,
    this.description,
  });

  static Notifi fromJson(json) => Notifi(
      not_id: json['not_id'],
      body: json['body'],
      category: json['category'],
      description: json['description'] ?? null);
}
