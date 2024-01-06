// ignore_for_file: must_be_immutable

part of 'edit_disabili_bloc.dart';

abstract class ReadDisabiliState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadDisabiliLoadingState extends ReadDisabiliState {}

class ReadDisabiliLoadedState extends ReadDisabiliState {
  DisabiliData data;
  ReadDisabiliLoadedState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ReadDisabiliErrorState extends ReadDisabiliState {
  String errorMessage;
  ReadDisabiliErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}


class EditDisabiliLoadingState extends ReadDisabiliState {}

class EditDisabiliLoadedState extends ReadDisabiliState {
  

 
}

class EditDisabiliErrorState extends ReadDisabiliState {
  String errorMessage;
  EditDisabiliErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

