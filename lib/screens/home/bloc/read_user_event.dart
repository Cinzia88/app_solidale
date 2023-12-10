part of "read_user_bloc.dart";

abstract class ReadUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserEvent extends ReadUserEvent {}

class EditUserEvent extends ReadUserEvent {
  String id;
  String nome;
  String indirizzo;
  String telefono;
  String email;

  EditUserEvent({
    required this.id,
    required this.nome,
    required this.indirizzo,
    required this.telefono,
    required this.email,
  
  });
  @override
  List<Object?> get props =>
      [id, nome, indirizzo, telefono, email, ];
}