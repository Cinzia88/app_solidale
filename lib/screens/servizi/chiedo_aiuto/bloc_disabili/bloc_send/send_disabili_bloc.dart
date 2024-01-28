import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/repo/send_disabili_repo.dart';


part 'send_disabili_event.dart';
part 'send_disabili_state.dart';

class SendDisabiliDataBloc
    extends Bloc<SendDisabiliDataEvent, SendDisabiliDataState> {
  final BuildContext context;
  final SendDisabiliDataRepository sendDisabiliDataRepository;
  SendDisabiliDataBloc({
    required this.context,
    required this.sendDisabiliDataRepository,
  }) : super(SendDisabiliDataInitial()) {
    on<SendDisabiliFormEvent>((event, emit) async {
      
        emit(SendDisabiliDataLoadingState());
        try {
          await sendDisabiliDataRepository.sendDisabiliData(
            context,
            event.numeroDisabili,
            event.disabile,
          );
          emit(SendDisabiliDataLoaded());
        } catch (e) {
          emit(
            SendDisabiliDataErrorState(
              message: e.toString(),
            ),
          );
        }  
    
    });
  }
}




/*  */