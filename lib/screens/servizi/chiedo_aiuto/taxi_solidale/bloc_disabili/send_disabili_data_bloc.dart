import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/repository/send_data_disabili_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_disabili_data_event.dart';
part 'send_disabili_data_state.dart';

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