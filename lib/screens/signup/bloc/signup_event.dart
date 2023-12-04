part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


// ignore: must_be_immutable
class SignUpTappedEvent extends SignUpEvent {
  String nome;
  String email;
  String telefono;
  String password;
  String confirmPassword;
  SignUpTappedEvent({
    required this.nome,
    required this.email,
    required this.telefono,
    required this.password,
    required this.confirmPassword,
  });
@override
  List<Object?> get props => [email, password, confirmPassword];
}

class SignInTappedEvent extends SignUpEvent {}