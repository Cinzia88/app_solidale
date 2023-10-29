part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {

  @override
  List<Object?> get props => [];
}


// ignore: must_be_immutable
class ResetPasswordFormEvent extends ResetPasswordEvent {
  String newPassword;
  String confirmPassword;
  ResetPasswordFormEvent({
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
    List<Object?> get props => [ newPassword, confirmPassword,];

}
