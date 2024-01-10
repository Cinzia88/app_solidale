// ignore_for_file: must_be_immutable

part of 'read_docs_bloc.dart';

abstract class ReadDocsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadDocsLoadingState extends ReadDocsState {}

class ReadDocsLoadedState extends ReadDocsState {
  List<DocsData> data;
  ReadDocsLoadedState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ReadDocsErrorState extends ReadDocsState {
  String errorMessage;
  ReadDocsErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}


class EditDocsLoadingState extends ReadDocsState {}

class EditDocsLoadedState extends ReadDocsState {
  

 
}

class EditDocsErrorState extends ReadDocsState {
  String errorMessage;
  EditDocsErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

