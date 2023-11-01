


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../repository/read_data_user.dart';
import '../model/get_user_model.dart';

part 'read_user_event.dart';
part 'read_user_state.dart';

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
