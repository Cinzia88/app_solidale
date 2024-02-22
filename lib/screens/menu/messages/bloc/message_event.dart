part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class FetchMessageEvent extends MessageEvent {
 
  @override
  List<Object> get props => [];
}
