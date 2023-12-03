import 'dart:io';

import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/repository/send_docs_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/model/model_parents_data.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_docs_event.dart';
part 'send_docs_state.dart';

class SendDocsBloc extends Bloc<SendDocsEvent, SendDocsState> {
  final BuildContext context;
  final SendDocsRepository sendDocsRepository;
  SendDocsBloc({
    required this.context,
    required this.sendDocsRepository,
  }) : super(SendDocsInitial()) {
    on<SendDocsFormEvent>((event, emit) async {
      emit(SendDocsLoadingState());
      try {
        await sendDocsRepository.sendDocs(
          context,
          event.body,
          event.imagepath,
          event.pdfpath,
        );
        emit(SendDocsLoaded());
      } catch (e) {
        emit(
          SendDocsErrorState(
            message: e.toString(),
          ),
        );
      }
    });
  }
} 

