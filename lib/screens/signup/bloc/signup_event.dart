part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class SignUpTappedEvent extends SignupEvent {
  String email;
  String password;
  String confirmPassword;
  SignUpTappedEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
@override
  List<Object?> get props => [email, password, confirmPassword];
}

class SignInTappedEvent extends SignupEvent {}