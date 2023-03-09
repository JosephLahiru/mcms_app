class Notifi {
  final String body;

  const Notifi({
    required this.body,
  });

  static Notifi fromJson(json) => Notifi(
        body: json['body'],
      );
}
