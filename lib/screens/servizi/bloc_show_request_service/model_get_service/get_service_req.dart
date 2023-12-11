import 'package:equatable/equatable.dart';

class ServiceReqData extends Equatable {
  final String id;
    final String user_id;

  final String service_id;
  final String nome;
  final String telefono;
 

  const ServiceReqData({
    required this.id,
    required this.user_id,
    required this.service_id,
    required this.nome,
    required this.telefono,
  
  });

  factory ServiceReqData.fromJson(Map<String, dynamic> json) {
    return ServiceReqData(
      id: json["id"].toString(),
            user_id: json["user_id"].toString(),
      service_id: json["service_id"].toString(),
      nome: json["nome"].toString(),
      telefono: json["telefono"].toString(),
  
    );
  }

  @override
  List<Object?> get props => [
        id,
        user_id,
        service_id,
        nome,
        telefono,
      ];
}
