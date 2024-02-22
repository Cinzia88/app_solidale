part of 'message_bloc.dart';


abstract class MessageState extends Equatable {}

class MessageLoadingState extends MessageState {
  @override
  List<Object?> get props => [];
}

class MessageLoadedState extends MessageState {
  final List<ListMessageModel> messages;

  MessageLoadedState(this.messages);

  @override
  List<Object?> get props => [messages];
}

class MessageErrorState extends MessageState {
  final String error;

  MessageErrorState(this.error);

  @override
  List<Object?> get props => [error];
}