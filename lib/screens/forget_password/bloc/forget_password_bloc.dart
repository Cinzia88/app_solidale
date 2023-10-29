import 'package:anf_app/screens/forget_password/repository/forget_password_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  BuildContext context;
  final ForgetPasswordRepository forgetPasswordRepository;
  ForgetPasswordBloc({
    required this.context,
    required this.forgetPasswordRepository,
  }) : super(ForgetPasswordInitialState()) {
    on<ForgetPasswordFormEvent>(
      (event, emit) async {
        emit(ForgetPasswordLoadingState());

        try {
          await forgetPasswordRepository.forgetPassword(
            context,
            event.email,
          );
          emit(ForgetPasswordLoadedState());
        } catch (e) {
          emit(ForgetPasswordErrorState(message: e.toString()));
        }
      },
    );
  }
}
