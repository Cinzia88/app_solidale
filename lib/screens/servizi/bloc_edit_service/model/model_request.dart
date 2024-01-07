import 'package:equatable/equatable.dart';

class RequestData extends Equatable {
  final String idRequest;
   String serviceId;
  final String nome;
  final String telefono;

   RequestData({
    required this.idRequest,
    required this.serviceId,
    required this.nome,
    required this.telefono,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
      idRequest: json["id"].toString(),
      serviceId: json["service_id"].toString(),
      nome: json["nome"].toString(),
      telefono: json["telefono"].toString(),
    );
  }

  @override
  List<Object?> get props => [
        serviceId,
        nome,
        telefono,
      ];
}
