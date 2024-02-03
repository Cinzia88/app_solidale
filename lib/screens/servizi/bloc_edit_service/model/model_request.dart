import 'package:equatable/equatable.dart';

class RequestData extends Equatable {
  final String idRequest;
  String serviceId;
  final String nome;
  final String telefono;
  String? partenza;
  String? destinazione;
  String? data;
  String? ora;


  RequestData({
    required this.idRequest,
    required this.serviceId,
    required this.nome,
    required this.telefono,
    this.partenza,
    this.destinazione,
    this.data,
    this.ora,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
      idRequest: json["id"].toString(),
      serviceId: json["service_id"].toString(),
      nome: json["nome"].toString(),
      telefono: json["telefono"].toString(),
      partenza: json["partenza"].toString(),
      destinazione: json["destinazione"].toString(),
      data: json['data'].toString(),
      ora: json['ora'].toString(),
    );
  }

  @override
  List<Object?> get props => [
        serviceId,
        nome,
        telefono,
        partenza,
        destinazione,
        data,
      ];
}
