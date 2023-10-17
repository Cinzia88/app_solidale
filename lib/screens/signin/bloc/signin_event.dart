part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SignInFormEvent extends SignInEvent {
   String email;
  String password;
  SignInFormEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}
 
 class HomeTappedEvent extends SignInEvent {}