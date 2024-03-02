// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/menu/messages/accompagnamento_oncologico/model/message_acc_model.dart';
import 'package:app_solidale/screens/menu/messages/accompagnamento_oncologico/repository/message_acc_repository.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/model/message_banco_model.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/model/message_taxi_model.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/repository/message_taxi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'message_acc_event.dart';
part 'message_acc_state.dart';

class MessageAccBloc extends Bloc<MessageAccEvent, MessageAccState> {
  final MessageAccRepository messageRepository;
    final BuildContext context;

  MessageAccBloc({required this.context, required this.messageRepository,}) : super(MessageAccLoadingState()) {
 
      on<MessageAccEvent>(
      (event, emit) async {
        if (event is FetchMessageAccEvent) {
          emit(MessageAccLoadingState());
      try {
        final messages = await messageRepository.getMessageAcc(context,);
        emit(MessageAccLoadedState(messages));
      } catch (e) {
        emit(MessageAccErrorState(e.toString()));
      }
        } else if (event is EditMessageAccEvent) {
          emit(EditMessageAccLoadingState());
          try {
            final messagedata = await messageRepository.editMessageAcc(
              context,
              event.idMessage,
              event.serviceId,
              event.data,
              event.risposta,
            );
            emit(EditMessageAccLoadedState());
          } catch (e) {
            emit(EditMessageAccErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
     
   
    
    
  }
}