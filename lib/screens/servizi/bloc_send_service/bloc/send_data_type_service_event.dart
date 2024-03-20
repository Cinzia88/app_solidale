part of 'send_data_type_service_bloc.dart';

abstract class SendServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendDataTypeServiceEvent extends SendServiceEvent {
  String serviceId;
  String? codiceFamiglia;
  String nome;
  String telefono;
    String? partenza;
  String? destinazione;
  String? data;
  String? ora;


 
  SendDataTypeServiceEvent({
    required this.serviceId,
    this.codiceFamiglia,
    required this.nome,
    required this.telefono,
     this.partenza,
     this.destinazione,
     this.data,
     this.ora,
  });
  @override
  List<Object?> get props => [serviceId, codiceFamiglia, nome, telefono, partenza, destinazione, data, ora];
}
