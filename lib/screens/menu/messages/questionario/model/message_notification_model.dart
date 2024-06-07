class MessageModelNotification {
  final String id;
  final String title;
  final String body;
  final String messaggioRicevuto;

  MessageModelNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.messaggioRicevuto,
  });

  factory MessageModelNotification.fromJson(Map<String, dynamic> json) {
    return MessageModelNotification(
      id: json["id"].toString(),
      title: json['title'].toString(),
      body: json['body'].toString(),
      messaggioRicevuto: json["created_at"].toString(),
    );
  }
}
