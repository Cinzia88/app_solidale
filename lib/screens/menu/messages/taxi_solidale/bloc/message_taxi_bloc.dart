// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/menu/messages/banco_message/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/model/message_banco_model.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/model/message_taxi_model.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/repository/message_taxi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'message_taxi_event.dart';
part 'message_taxi_state.dart';

class MessageTaxiBloc extends Bloc<MessageTaxiEvent, MessageTaxiState> {
  final MessageTaxiRepository messageRepository;
    final BuildContext context;

  MessageTaxiBloc({required this.context, required this.messageRepository,}) : super(MessageTaxiLoadingState()) {
 
      on<MessageTaxiEvent>(
      (event, emit) async {
        if (event is FetchMessageTaxiEvent) {
          emit(MessageTaxiLoadingState());
      try {
        final messages = await messageRepository.getMessageTaxi(context,);
        emit(MessageTaxiLoadedState(messages));
      } catch (e) {
        emit(MessageTaxiErrorState(e.toString()));
      }
        } else if (event is EditMessageTaxiEvent) {
          emit(EditMessageTaxiLoadingState());
          try {
            final messagedata = await messageRepository.editMessageTaxi(
              context,
              event.idMessage,
              event.serviceId,
              event.data,
              event.risposta,
            );
            emit(EditMessageTaxiLoadedState());
          } catch (e) {
            emit(EditMessageTaxiErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
     
   
    
    
  }
}