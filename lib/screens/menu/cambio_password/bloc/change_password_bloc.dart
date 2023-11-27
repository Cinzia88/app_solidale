

import 'package:app_solidale/screens/menu/cambio_password/repository/change_password_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  BuildContext context;
  final ChangePasswordRepository changePasswordRepository;
  ChangePasswordBloc({
    required this.context,
    required this.changePasswordRepository,
  }) : super(ChangePasswordInitialState()) {
    on<ChangePasswordFormEvent>((event, emit) async{
      emit(ChangePasswordLoadingState());

      try {
         await changePasswordRepository.changePasswordUser(
            context,
            event.currentPassword,
            event.newPassword,
            event.confirmPassword,
          );
          emit(ChangePasswordLoaded());
      } catch (e) {
        emit(ChangePasswordErrorState(message: e.toString()));
      }
    },);
  }
}
