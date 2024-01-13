// ignore_for_file: must_be_immutable

part of 'read_parents_bloc.dart';

abstract class ReadParentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadParentsLoadingState extends ReadParentsState {}

class ReadParentsLoadedState extends ReadParentsState {
  List<ParentsData> data;
  ReadParentsLoadedState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ReadParentsErrorState extends ReadParentsState {
  String errorMessage;
  ReadParentsErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}


class EditParentsLoadingState extends ReadParentsState {}

class EditParentsLoadedState extends ReadParentsState {
  

 
}

class EditParentsErrorState extends ReadParentsState {
  String errorMessage;
  EditParentsErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

class SendNewParentsState extends ReadParentsState {
  

 
}

class RemoveParentsState extends ReadParentsState {
  String id;
  RemoveParentsState({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

