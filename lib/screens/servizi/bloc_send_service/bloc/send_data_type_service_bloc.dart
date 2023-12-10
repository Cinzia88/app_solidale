
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_data_type_service_event.dart';
part 'send_data_type_service_state.dart';

class SendDataTypeServiceBloc extends Bloc<SendDataTypeServiceEvent, SendDataTypeServiceState> {
  final BuildContext context;
  final SendDataTypeServiceRepository sendDataTypeServiceRepository;
  SendDataTypeServiceBloc({
    required this.context,
    required this.sendDataTypeServiceRepository,
  }) : super(SendDataTypeServiceInitial()) {
    on<SendDataTypeServiceEvent>((event, emit) async {
      emit(SendDataTypeServiceLoadingState());
      try {
        await sendDataTypeServiceRepository.sendDataTypeservice(
          context,
          event.serviceId,
          event.tipoRichiesta,
          event.nome,
          event.telefono,
        );
        emit(SendDataTypeServiceLoaded());
      } catch (e) {
        emit(
          SendDataTypeServiceErrorState(
            message: e.toString(),
          ),
        );
      }
    });
  }
} 

