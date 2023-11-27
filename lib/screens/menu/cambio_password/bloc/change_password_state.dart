part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordLoaded extends ChangePasswordState {}


class ChangePasswordErrorState extends ChangePasswordState {
  final String message;

  ChangePasswordErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




