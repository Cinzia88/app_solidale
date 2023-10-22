part of 'signin_bloc.dart';

abstract class SignInState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}


class SignInLoaded extends SignInState {}


class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class ScreenCreateAccountState extends SignInState{}
class ScreenResetPasswordState extends SignInState{}


class SignInLoadingState extends SignInState {}