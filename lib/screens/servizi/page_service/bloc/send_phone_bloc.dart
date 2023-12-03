import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/model/model_parents_data.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';
import 'package:app_solidale/screens/servizi/page_service/repository/send_phone_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'send_phone_event.dart';
part 'send_phone_state.dart';

class SendPhoneBloc extends Bloc<SendPhoneEvent, SendPhoneState> {
  final BuildContext context;
  final SendPhoneRepository sendPhoneRepository;
  SendPhoneBloc({
    required this.context,
    required this.sendPhoneRepository,
  }) : super(SendPhoneInitial()) {
    on<SendPhoneFormEvent>((event, emit) async {
        emit(SendPhonLoadingState());
        try {
          await sendPhoneRepository.sendPhone(
            context,
            event.telefono,
          );
          emit(SendPhoneLoaded());
        } catch (e) {
          emit(
            SendPhoneErrorState(
              message: e.toString(),
            ),
          );
        }
    
    });
  }
}




/*  */