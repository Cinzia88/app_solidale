import 'package:app_solidale/screens/home/model/get_user_model.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/model/edit_parents_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/repo/edit_parents_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'read_parents_state.dart';
part 'read_parents_event.dart';

class ReadParentsBloc extends Bloc<ReadParentsEvent, ReadParentsState> {
  BuildContext context;
  final EditDataParentsRepository editDataParentsRepository;
  ReadParentsBloc({
    required this.editDataParentsRepository,
    required this.context,
  }) : super(ReadParentsLoadingState()) {
    on<ReadParentsEvent>(
      (event, emit) async {
        if (event is FetchParentsEvent) {
          emit(ReadParentsLoadingState());
          try {
            final userdata = await editDataParentsRepository.getParentsData(context);
            emit(ReadParentsLoadedState(data: userdata));
          } catch (e) {
            emit(ReadParentsErrorState(errorMessage: e.toString()));
          }
        } else if (event is EditParentsEvent) {
          emit(EditParentsLoadingState());
          try {
            final userdata = await editDataParentsRepository.editDataParents(
              context,
              event.id,
              event.nome,
              event.dataDiNascita,
              event.grado,
            );
            emit(EditParentsLoadedState());
          } catch (e) {
            emit(EditParentsErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
  }
}
