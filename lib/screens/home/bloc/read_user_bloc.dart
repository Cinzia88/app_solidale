


import 'package:app_solidale/screens/home/model/get_user_model.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'read_user_state.dart';
part 'read_user_event.dart';


class ReadUserBloc extends Bloc<ReadUserEvent, ReadUserState> {
  BuildContext context;
  final ReadDataUserRepository readDataUserRepository;
  ReadUserBloc({
    required this.readDataUserRepository,
    required this.context,
  }) : super(ReadUserLoadingState()) {
    on<FetchUserEvent>((event, emit) async{
      emit(ReadUserLoadingState());
      try {
        final userdata = await readDataUserRepository.readUser(context);
        emit(ReadUserLoadedState(data: userdata));
      } catch (e) {
        emit(ReadUserErrorState(errorMessage: e.toString()));
      }
    },);
  }
  
}