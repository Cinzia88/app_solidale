// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/menu/messages/banco_message/model/list_messages_model.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  int page = 1;
  bool isFetching = false;
  ScrollController scrollController = ScrollController();
  final MessageRepository messageRepository;
    final BuildContext context;

  MessageBloc({required this.context, required this.messageRepository,}) : super(MessageLoadingState()) {
     scrollController.addListener(() {
                          if (scrollController.offset ==
                                  scrollController.position.maxScrollExtent &&
                              !isFetching) {
                            isFetching = true;
                              add(FetchMessageEvent());
                          }
                        });
      on<MessageEvent>(
      (event, emit) async {
        if (event is FetchMessageEvent) {
          emit(MessageLoadingState());
      try {
        final messages = await messageRepository.getListMessages(context,page);
        emit(MessageLoadedState(messages));
        page++;
      } catch (e) {
        emit(MessageErrorState(e.toString()));
      }
        } else if (event is EditMessageEvent) {
          emit(EditMessageLoadingState());
          try {
            final messagedata = await messageRepository.editMessage(
              context,
              event.idMessage,
              event.serviceId,
              event.inviato,
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