part of 'read_docs_bloc.dart';

abstract class ReadDocsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDocsEvent extends ReadDocsEvent {}

class EditDocsEvent extends ReadDocsEvent {
  String id;
  Map<String, String> body;
   List<File> imagepath;
      List<File> pdfpath;
  EditDocsEvent({
    required this.id,
    required this.body,
    required this.imagepath,
    required this.pdfpath,
  
  });
  @override
  List<Object?> get props =>
      [id, body, imagepath, pdfpath];
}