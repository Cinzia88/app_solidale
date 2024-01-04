part of 'edit_data_type_service_bloc.dart';

abstract class EditServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class EditDataTypeServiceEvent extends EditServiceEvent {
  String idRequest;
  String serviceId;
  String nome;
  String telefono;
 
  EditDataTypeServiceEvent({
required this.idRequest,
    required this.serviceId,
    required this.nome,
    required this.telefono,
  });
  @override
  List<Object?> get props => [idRequest, serviceId, nome, telefono];
}
