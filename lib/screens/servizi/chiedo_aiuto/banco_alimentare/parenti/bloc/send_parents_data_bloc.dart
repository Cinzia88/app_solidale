import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_parents_data_event.dart';
part 'send_parents_data_state.dart';

class SendParentsDataBloc
    extends Bloc<SendParentsDataEvent, SendParentsDataState> {
  final BuildContext context;
  final SendDataParentsRepository sendDataParentsRepository;
  SendParentsDataBloc({
    required this.context,
    required this.sendDataParentsRepository,
  }) : super(SendParentsDataInitialState()) {
    on<SendParentsFormEvent>((event, emit) async {
        emit(SendParentsDataLoadingState());
        try {
          await sendDataParentsRepository.sendDataParents(
            context,
            event.nomeParente,
            event.dataDiNascitaParente,
            event.gradoParente,
          );
          emit(SendParentsDataLoadedState());
        } catch (e) {
          emit(
            SendParentsDataErrorState(
              message: e.toString(),
            ),
          );
        }
      
    });
  }
}




/*  */