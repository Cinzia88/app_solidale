part of 'message_bloc.dart';

abstract class MessageNoticationEvent extends Equatable {
  const MessageNoticationEvent();
}

class FetchMessageNoticationEvent extends MessageNoticationEvent {
 
  @override
  List<Object?> get props => [];
}

