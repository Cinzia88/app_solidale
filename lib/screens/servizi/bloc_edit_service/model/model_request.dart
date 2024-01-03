import 'package:equatable/equatable.dart';

class RequestData extends Equatable {
  final String serviceId;
  final String nome;
  final String telefono;

  const RequestData({
    required this.serviceId,
    required this.nome,
    required this.telefono,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
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
