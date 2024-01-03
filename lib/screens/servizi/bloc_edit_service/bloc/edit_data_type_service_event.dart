part of 'edit_data_type_service_bloc.dart';

abstract class EditServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class FetchRequestEvent extends EditServiceEvent {}

// ignore: must_be_immutable
class EditDataTypeServiceEvent extends EditServiceEvent {
  String serviceId;
  String nome;
  String telefono;
 
  EditDataTypeServiceEvent({
    required this.serviceId,
    required this.nome,
    required this.telefono,
  });
  @override
  List<Object?> get props => [serviceId, nome, telefono];
}
