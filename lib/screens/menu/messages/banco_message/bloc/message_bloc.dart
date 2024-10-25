// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/menu/messages/banco_message/model/message_banco_model.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageBancoRepository messageRepository;
    final BuildContext context;

  MessageBloc({required this.context, required this.messageRepository,}) : super(MessageLoadingState()) {
 
      on<MessageEvent>(
      (event, emit) async {
        if (event is FetchMessageEvent) {
          emit(MessageLoadingState());
      try {
        final messages = await messageRepository.getMessageBanco(context,);
        emit(MessageLoadedState(messages));
      } catch (e) {
        emit(MessageErrorState(e.toString()));
      }
        } else if (event is EditMessageEvent) {
          emit(EditMessageLoadingState());
          try {
            final messagedata = await messageRepository.editMessageBanco(
              context,
              event.idMessage,
              event.userId,
              event.serviceId,
              event.dataInvio,
              event.dataConsegna,
              event.risposta,
              event.consegnato,
            );
            emit(EditMessageLoadedState());
          } catch (e) {
            emit(EditMessageErrorState(errorMessage: e.toString()));
          }
        }
      },
    );
     
   
    
    
  }
}