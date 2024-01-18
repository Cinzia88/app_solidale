part of 'send_data_type_service_bloc.dart';

abstract class SendServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendDataTypeServiceEvent extends SendServiceEvent {
  String serviceId;
  String nome;
  String telefono;
    String? partenza;
  String? destinazione;


 
  SendDataTypeServiceEvent({
    required this.serviceId,
    required this.nome,
    required this.telefono,
     this.partenza,
     this.destinazione,
  });
  @override
  List<Object?> get props => [serviceId, nome, telefono];
}
