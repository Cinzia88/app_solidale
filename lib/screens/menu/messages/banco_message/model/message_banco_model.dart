class MessageModelBanco {
 final String id;
 final String userId;
 final String serviceId;
 final String dataConsegna;
 String? risposta;
final String messaggioRicevuto;

 

  MessageModelBanco({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.dataConsegna,
    this.risposta,
    required this.messaggioRicevuto,
  });

  factory MessageModelBanco.fromJson(Map<String, dynamic> json) {
    return MessageModelBanco(
    id: json["id"].toString(),
    userId: json['user_id'].toString(),
    serviceId: json['service_id'].toString(),
    dataConsegna: json["data_consegna"].toString(),
    risposta: json["risposta"].toString(),
        messaggioRicevuto: json["created_at"].toString(),
    );
  }
}