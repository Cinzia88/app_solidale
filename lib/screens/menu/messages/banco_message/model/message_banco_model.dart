class MessageModelBanco {
  final String id;
  final String userId;
  final String serviceId;
  final String dataInvio;
  final String dataConsegna;
  String? risposta;
  final String consegnato;

  MessageModelBanco({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.dataInvio,
    required this.dataConsegna,
    this.risposta,
    required this.consegnato,
  });

  factory MessageModelBanco.fromJson(Map<String, dynamic> json) {
    return MessageModelBanco(
      id: json["id"].toString(),
      userId: json['user_id'].toString(),
      serviceId: json['service_id'].toString(),
      dataInvio: json["data_invio"].toString(),
      dataConsegna: json["data_consegna"].toString(),
      risposta: json["risposta"].toString(),
      consegnato: json["consegnato"].toString(),
    );
  }
}
