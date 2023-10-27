part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {

  @override
  List<Object?> get props => [];
}


// ignore: must_be_immutable
class ChangePasswordFormEvent extends ChangePasswordEvent {
  String currentPassword;
  String newPassword;
  String confirmPassword;
  ChangePasswordFormEvent({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
    List<Object?> get props => [currentPassword, newPassword, confirmPassword,];

}
