import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/repository/send_data_taxi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_taxi_data_event.dart';
part 'send_taxi_data_state.dart';

class SendTaxiDataBloc
    extends Bloc<SendTaxiDataEvent, SendTaxiDataState> {
  final BuildContext context;
  final SendTaxiDataRepository sendTaxiDataRepository;
  SendTaxiDataBloc({
    required this.context,
    required this.sendTaxiDataRepository,
  }) : super(SendTaxiDataInitial()) {
    on<SendTaxiDataEvent>((event, emit) async {
      
       
    
    });
  }
}




/*  */