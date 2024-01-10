part of 'read_docs_bloc.dart';

abstract class ReadDocsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDocsEvent extends ReadDocsEvent {}

class EditDocsEvent extends ReadDocsEvent {
  String id;
  String nome;
  String path;
  String mime;

  EditDocsEvent({
    required this.id,
    required this.nome,
    required this.path,
    required this.mime,
  
  });
  @override
  List<Object?> get props =>
      [id, nome, path, mime];
}