// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/menu/messages/model/list_messages_model.dart';
import 'package:app_solidale/screens/menu/messages/repository/message_repository.dart';
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
   
    on<FetchMessageEvent>((event, emit) async {
      emit(MessageLoadingState());
      try {
        final news = await messageRepository.getListNews(context,page);
        emit(MessageLoadedState(news));
        page++;
      } catch (e) {
        emit(MessageErrorState(e.toString()));
      }
    });
    
  }
}