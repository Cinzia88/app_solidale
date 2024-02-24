part of 'message_bloc.dart';


abstract class MessageState extends Equatable {
   @override
  List<Object?> get props => [];
}

class MessageLoadingState extends MessageState {
 
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


class EditMessageLoadingState extends MessageState {}

class EditMessageLoadedState extends MessageState {
  

 
}

class EditMessageErrorState extends MessageState {
  String errorMessage;
  EditMessageErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}