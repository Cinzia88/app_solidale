part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordLoadedState extends ForgetPasswordState {}


class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;

  ForgetPasswordErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




