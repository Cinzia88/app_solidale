class MessageModelTaxi {
  final String id;
  final String userId;
  final String serviceId;
  final String data;
  String? risposta;
  final String messaggioRicevuto;

  MessageModelTaxi({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.data,
    this.risposta,
    required this.messaggioRicevuto,
  });

  factory MessageModelTaxi.fromJson(Map<String, dynamic> json) {
    return MessageModelTaxi(
      id: json["id"].toString(),
      userId: json['user_id'].toString(),
      serviceId: json['service_id'].toString(),
      data: json["data"].toString(),
      risposta: json["risposta"].toString(),
      messaggioRicevuto: json["created_at"].toString(),
    );
  }
}
