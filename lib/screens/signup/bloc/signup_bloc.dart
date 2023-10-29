import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/signup_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignupRepository signupRepository;
  final BuildContext context;
  SignUpBloc({
    required this.signupRepository,
    required this.context,
  }) : super(SignupInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpTappedEvent) {
        emit(SignupLoadingState());
        try {
          await signupRepository.registerUserWithVerificationEmail(context, event.nome, event.email,
              event.password, event.confirmPassword, event.richiesta);
          emit(SignupLoaded());
          emit(SignUpSuccessState());
        } catch (e) {
          emit(
            SignupErrorState(
              message: e.toString(),
            ),
          );
        }
      } 
    });
  }
}
