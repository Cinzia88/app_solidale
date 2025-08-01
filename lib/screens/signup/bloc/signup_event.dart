part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SignUpTappedEvent extends SignUpEvent {
  String nome;
  String indirizzo;
  String telefono;
  String email;
  String password;
  String confirmPassword;
  SignUpTappedEvent({
    required this.nome,
    required this.indirizzo,
    required this.telefono,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object?> get props =>
      [nome, indirizzo, telefono, email, password, confirmPassword];
}

class SignInTappedEvent extends SignUpEvent {}
