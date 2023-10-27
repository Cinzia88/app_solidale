part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignUpState {}


class SignupLoaded extends SignUpState {}


class SignupErrorState extends SignUpState {
  final String message;

  SignupErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


class NextSignInPageState extends SignUpState {}

class SignupLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState{}