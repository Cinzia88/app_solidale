
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'read_request_state.dart';
part 'read_request_event.dart';

class ReadRequestBloc extends Bloc<ReadRequestEvent, ReadRequestState> {
  BuildContext context;
  final EditDataTypeServiceRepository editDataTypeServiceRepository;
  ReadRequestBloc({
    required this.editDataTypeServiceRepository,
    required this.context,
  }) : super(ReadRequestLoadingState()) {
    on<ReadRequestEvent>(
      (event, emit) async {
        if (event is FetchRequestEvent) {
          emit(ReadRequestLoadingState());
          try {
            final userdata = await editDataTypeServiceRepository.getRequestData(context);
            emit(ReadRequestLoadedState(data: userdata));
          } catch (e) {
            emit(ReadRequestErrorState(errorMessage: e.toString()));
          }
        } else if (event is EditRequestEvent) {
          emit(EditRequestLoadingState());
          try {
            final userdata = await editDataTypeServiceRepository.editRequest(
              context,
              event.id,
              event.serviceId,
              event.nome,
              event.telefono,
              event.partenza!,
              event.destinazione!,
              event.data!,
              event.ora!,
            );
            emit(EditRequestLoadedState());
          } catch (e) {
            emit(EditRequestErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
  }
}
