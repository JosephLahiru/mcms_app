class Notifi {
  final int not_id;
  final String body;
  final String category;

  const Notifi({
    required this.not_id,
    required this.body,
    required this.category,
  });

  static Notifi fromJson(json) => Notifi(
        not_id: json['not_id'],
        body: json['body'],
        category: json['category'],
      );
}
