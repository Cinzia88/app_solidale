import 'package:app_solidale/screens/home/model/get_user_model.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc_edit_disabili/model/edit_disabili_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc_edit_disabili/repo/edit_disabili_repo.dart';
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
            emit(ReadDisabiliLoadedState(data: userdata));
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
