import 'package:app_solidale/screens/home/model/get_user_model.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/model/edit_parents_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/repo/edit_parents_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'read_docs_state.dart';
part 'read_docs_event.dart';

class ReadDocsBloc extends Bloc<ReadDocsEvent, ReadDocsState> {
  BuildContext context;
  final EditDocsRepository editDocsRepository;
  ReadDocsBloc({
    required this.editDocsRepository,
    required this.context,
  }) : super(ReadDocsLoadingState()) {
    on<ReadDocsEvent>(
      (event, emit) async {
        if (event is FetchDocsEvent) {
          emit(ReadDocsLoadingState());
          try {
            final userdata = await editDocsRepository.getDocsData(context);
            emit(ReadDocsLoadedState(data: userdata));
          } catch (e) {
            emit(ReadDocsErrorState(errorMessage: e.toString()));
          }
        } else if (event is EditDocsEvent) {
          emit(EditDocsLoadingState());
          try {
            final userdata = await editDocsRepository.editDocs(
              context,
              event.id,
              event.nome,
              event.path,
              event.mime,
            );
            emit(EditDocsLoadedState());
          } catch (e) {
            emit(EditDocsErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
  }
}
