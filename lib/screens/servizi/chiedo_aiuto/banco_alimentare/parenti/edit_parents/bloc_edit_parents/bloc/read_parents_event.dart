part of 'read_parents_bloc.dart';

abstract class ReadParentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchParentsEvent extends ReadParentsEvent {}

class EditParentsEvent extends ReadParentsEvent {
  String id;
  String nome;
  String dataDiNascita;
  String grado;

  EditParentsEvent({
    required this.id,
    required this.nome,
    required this.dataDiNascita,
    required this.grado,
  
  });
  @override
  List<Object?> get props =>
      [id, nome, dataDiNascita, grado];
}