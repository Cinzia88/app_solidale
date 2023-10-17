
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final BuildContext context;
  SignInBloc({
    required this.context,
  }) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if(event is SignInFormEvent) {
        emit(SignInLoadingState());

        try {
          emit(SignInLoaded());
        } catch (e) {
           emit(
          SignInErrorState(
            message: e.toString(),
          ),
        );
        }
      } else if (event is HomeTappedEvent) {
      emit(NextHomePageState());
    }
    });
  }
}
