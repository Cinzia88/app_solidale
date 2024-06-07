// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/menu/messages/questionario/model/message_notification_model.dart';
import 'package:app_solidale/screens/menu/messages/questionario/repository/message_notification_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'message_event.dart';
part 'message_state.dart';

class MessageNotificationBloc extends Bloc<MessageNoticationEvent, MessageNotificationState> {
  final MessageNoticationRepository messageRepository;
    final BuildContext context;

  MessageNotificationBloc({required this.context, required this.messageRepository,}) : super(MessageNotificationLoadingState()) {
 
      on<FetchMessageNoticationEvent>(
      (event, emit) async {
          emit(MessageNotificationLoadingState());
      try {
        final messages = await messageRepository.getMessageBanco(context,);
        emit(MessageNotificationLoadedState(messages));
      } catch (e) {
        emit(MessageNotificationErrorState(e.toString()));
      }
        
        
      },
    );
     
   
    
    
  }
}