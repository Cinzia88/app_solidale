part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {

  @override
  List<Object?> get props => [];
}


// ignore: must_be_immutable
class ForgetPasswordFormEvent extends ForgetPasswordEvent {
  String email;
  ForgetPasswordFormEvent({
    required this.email,
  });

  @override
    List<Object?> get props => [email,];

}
