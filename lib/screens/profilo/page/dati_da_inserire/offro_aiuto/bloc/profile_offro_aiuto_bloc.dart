import 'package:app_solidale/screens/profilo/page/dati_da_inserire/offro_aiuto/repository/insert_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_offro_aiuto_event.dart';
part 'profile_offro_aiuto_state.dart';

class OffroAiutoDataBloc
    extends Bloc<OffroAiutoDataEvent, OffroAiutoDataState> {
  final BuildContext context;
  final InsertDataOffroAiutoRepository dataProfileOffroAiutoRepository;
  OffroAiutoDataBloc({
    required this.context,
    required this.dataProfileOffroAiutoRepository,
  }) : super(OffroAiutoDataInitialState()) {
    on<OffroAiutoDataFormEvent>((event, emit) async {
      emit(OffroAiutoDataLoadedState());
      try {
        await dataProfileOffroAiutoRepository.dataFormRepository(
          context,
          event.richiesta,
          event.nome,
          event.cognome,
          event.email,
          event.telefono,
          event.tipoAiuto,
          event.associazione,
        );
        emit(OffroAiutoDataLoadedState());
      } catch (e) {
        emit(
          OffroAiutoDataErrorState(
            message: e.toString(),
          ),
        );
      }
    });
  }
}
