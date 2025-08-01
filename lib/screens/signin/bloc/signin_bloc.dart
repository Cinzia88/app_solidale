import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/signin_repository.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final BuildContext context;
  final SignInRepository signInRepository;
  SignInBloc({
    required this.context,
    required this.signInRepository,
  }) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is SignInFormEvent) {
        emit(SignInLoadingState());
        try {
          await signInRepository.loginUser(
            context,
            event.email,
            event.password,
          );
          emit(SignInLoaded());
        } catch (e) {
          emit(
            SignInErrorState(
              message: e.toString(),
            ),
          );
        }
      } else if (event is ScreenCreateAccountEvent) {
        emit(ScreenCreateAccountState());
      } else if (event is ScreenResetPasswordEvent) {
        emit(ScreenResetPasswordState());
      }
    });
  }
}
