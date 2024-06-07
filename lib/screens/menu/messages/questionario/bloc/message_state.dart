part of 'message_bloc.dart';


abstract class MessageNotificationState extends Equatable {
   @override
  List<Object?> get props => [];
}

class MessageNotificationLoadingState extends MessageNotificationState {
 
}

class MessageNotificationLoadedState extends MessageNotificationState {
  final MessageModelNotification messages;

  MessageNotificationLoadedState(this.messages);

  @override
  List<Object?> get props => [messages];
}

class MessageNotificationErrorState extends MessageNotificationState {
  final String error;

  MessageNotificationErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

