class ListMessageModel {
 final String id;
 final String userId;
 final String serviceId;
 final String dataConsegna;
 

  ListMessageModel({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.dataConsegna,
  });

  factory ListMessageModel.fromJson(Map<String, dynamic> json) {
    return ListMessageModel(
    id: json["id"].toString(),
    userId: json['user_id'].toString(),
    serviceId: json['service_id'].toString(),
    dataConsegna: json["data_consegna"].toString(),
    );
  }
}