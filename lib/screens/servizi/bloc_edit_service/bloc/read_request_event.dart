part of 'read_request_bloc.dart';

abstract class ReadRequestEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRequestEvent extends ReadRequestEvent {}

class EditRequestEvent extends ReadRequestEvent {
  String id;
  String serviceId;
  String nome;
  String telefono;

  EditRequestEvent({
    required this.id,
    required this.serviceId,
    required this.nome,
    required this.telefono,
  
  });
  @override
  List<Object?> get props =>
      [id, serviceId, nome, telefono];
}