part of 'send_data_type_service_bloc.dart';

abstract class SendServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendDataTypeServiceEvent extends SendServiceEvent {
  String serviceId;
  String tipoRichiesta;
  String nome;
  String telefono;
 
  SendDataTypeServiceEvent({
    required this.serviceId,
    required this.tipoRichiesta,
    required this.nome,
    required this.telefono,
  });
  @override
  List<Object?> get props => [serviceId, tipoRichiesta, nome, telefono];
}
