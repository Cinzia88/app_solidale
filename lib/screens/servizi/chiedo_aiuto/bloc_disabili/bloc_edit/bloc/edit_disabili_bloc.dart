
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'edit_disabili_state.dart';
part 'edit_disabili_event.dart';

class ReadDisabiliBloc extends Bloc<ReadDisabiliEvent, ReadDisabiliState> {
  BuildContext context;
  final EditDataDisabiliRepository editDataDisabiliRepository;
  ReadDisabiliBloc({
    required this.editDataDisabiliRepository,
    required this.context,
  }) : super(ReadDisabiliLoadingState()) {
    on<ReadDisabiliEvent>(
      (event, emit) async {
        if (event is FetchDisabiliEvent) {
          emit(ReadDisabiliLoadingState());
          try {
            final userdata = await editDataDisabiliRepository.getDisabiliData(context);
            emit(ReadDisabiliLoadedState(data: userdata!));
          } catch (e) {
            emit(ReadDisabiliErrorState(errorMessage: e.toString()));
          }
        } else if (event is EditDisabiliEvent) {
          emit(EditDisabiliLoadingState());
          try {
            final userdata = await editDataDisabiliRepository.editDataDisabili(
              context,
              event.id,
              event.numeroDisabili,
              event.disabile ,
            );
            emit(EditDisabiliLoadedState());
          } catch (e) {
            emit(EditDisabiliErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
  }
}
