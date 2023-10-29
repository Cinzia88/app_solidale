


import 'package:anf_app/screens/reset_password/repository/reset_password_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  BuildContext context;
  final ResetPasswordRepository resetPasswordRepository;
  ResetPasswordBloc({
    required this.context,
    required this.resetPasswordRepository,
  }) : super(ResetPasswordInitialState()) {
    on<ResetPasswordFormEvent>((event, emit) async{
      emit(ResetPasswordLoadingState());

      try {
         await resetPasswordRepository.resetPasswordUser(
            context,
            event.newPassword,
            event.confirmPassword,
          );
          emit(ResetPasswordLoadedState());
      } catch (e) {
        emit(ResetPasswordErrorState(message: e.toString()));
      }
    },);
  }
}
