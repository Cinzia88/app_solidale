
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_show_request_service/model_get_service/get_service_req.dart';
import 'package:app_solidale/screens/servizi/bloc_show_request_service/repository/show_data_type_service_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_data_type_service_event.dart';
part 'show_data_type_service_state.dart';

class ShowDataTypeServiceBloc extends Bloc<ShowDataTypeServiceEvent, ShowDataTypeServiceState> {
  final BuildContext context;
  final ShowDataTypeServiceRepository showDataTypeServiceRepository;
  ShowDataTypeServiceBloc({
    required this.context,
    required this.showDataTypeServiceRepository,
  }) : super(ShowDataTypeServiceInitial()) {
    on<ShowDataTypeServiceEvent>((event, emit) async {
      emit(ShowDataTypeServiceLoadingState());
      try {
        final showServicedata = await await showDataTypeServiceRepository.showDataTypeservice(context);
       
        emit(ShowDataTypeServiceLoaded(data:showServicedata ));
      } catch (e) {
        emit(
          ShowDataTypeServiceErrorState(
            message: e.toString(),
          ),
        );
      }
    });
  }
} 

