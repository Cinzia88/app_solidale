part of 'show_data_type_service_bloc.dart';

abstract class ShowServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ShowDataTypeServiceEvent extends ShowServiceEvent {
  String serviceId;
  String nome;
  String telefono;
 
  ShowDataTypeServiceEvent({
    required this.serviceId,
    required this.nome,
    required this.telefono,
  });
  @override
  List<Object?> get props => [serviceId, nome, telefono];
}
