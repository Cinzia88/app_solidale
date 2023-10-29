part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordLoadedState extends ResetPasswordState {}


class ResetPasswordErrorState extends ResetPasswordState {
  final String message;

  ResetPasswordErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




