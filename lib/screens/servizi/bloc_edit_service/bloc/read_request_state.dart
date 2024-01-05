// ignore_for_file: must_be_immutable

part of 'read_request_bloc.dart';

abstract class ReadRequestState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadRequestLoadingState extends ReadRequestState {}

class ReadRequestLoadedState extends ReadRequestState {
  List<RequestData> data;
  ReadRequestLoadedState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ReadRequestErrorState extends ReadRequestState {
  String errorMessage;
  ReadRequestErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}


class EditRequestLoadingState extends ReadRequestState {}

class EditRequestLoadedState extends ReadRequestState {
  

 
}

class EditRequestErrorState extends ReadRequestState {
  String errorMessage;
  EditRequestErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

