// ignore_for_file: must_be_immutable

part of "read_user_bloc.dart";

abstract class ReadUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadUserLoadingState extends ReadUserState {}

class ReadUserLoadedState extends ReadUserState {
  UserData data;
  ReadUserLoadedState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ReadUserErrorState extends ReadUserState {
  String errorMessage;
  ReadUserErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}


class EditUserLoadingState extends ReadUserState {}

class EditUserLoadedState extends ReadUserState {
  

 
}

class EditUserErrorState extends ReadUserState {
  String errorMessage;
  EditUserErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

