class Notifi {
  final String body;
  final String category;

  const Notifi({
    required this.body,
    required this.category,
  });

  static Notifi fromJson(json) => Notifi(
        body: json['body'],
        category: json['category'],
      );
}
