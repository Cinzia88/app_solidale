part of 'send_docs_bloc.dart';

abstract class SendDocsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendDocsFormEvent extends SendDocsEvent {
  Map<String, String> body;
   List<File> imagepath;
      List<File> pdfpath;
 
  SendDocsFormEvent({
    required this.body,
    required this.imagepath,
    required this.pdfpath
  });
  @override
  List<Object?> get props => [body, imagepath, pdfpath];
}
