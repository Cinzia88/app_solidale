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
    String? partenza;
  String? destinazione;
  String? data;
  String? ora;


  EditRequestEvent({
    required this.id,
    required this.serviceId,
    required this.nome,
    required this.telefono,
  this.partenza,
  this.destinazione,
  this.data,
  this.ora,
  });
  @override
  List<Object?> get props =>
      [id, serviceId, nome, telefono, partenza, destinazione, data, ora];
}