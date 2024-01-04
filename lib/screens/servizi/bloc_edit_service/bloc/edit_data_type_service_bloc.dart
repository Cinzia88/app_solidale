
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/edit_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_data_type_service_event.dart';
part 'edit_data_type_service_state.dart';

class EditDataTypeServiceBloc extends Bloc<EditDataTypeServiceEvent, EditDataTypeServiceState> {
  final BuildContext context;
  final EditDataTypeServiceRepository editDataTypeServiceRepository;
  EditDataTypeServiceBloc({
    required this.context,
    required this.editDataTypeServiceRepository,
  }) : super(EditDataTypeServiceInitial()) {
    on<EditDataTypeServiceEvent>((event, emit) async {
         emit(EditDataTypeServiceLoadingState());
          try {
            final userdata = await editDataTypeServiceRepository.editDataTypeservice(
              context,
              event.idRequest,
              event.serviceId,
              event.nome,
              event.telefono,
            );
            emit(EditDataTypeServiceLoaded(data: userdata));
          } catch (e) {
            emit(EditDataTypeServiceErrorState(message: e.toString()));
          }
  });
  }
} 

