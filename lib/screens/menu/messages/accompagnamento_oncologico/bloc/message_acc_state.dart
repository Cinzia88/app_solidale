part of 'message_acc_bloc.dart';


abstract class MessageAccState extends Equatable {
   @override
  List<Object?> get props => [];
}

class MessageAccLoadingState extends MessageAccState {
 
}

class MessageAccLoadedState extends MessageAccState {
  final MessageModelAcc messages;

  MessageAccLoadedState(this.messages);

  @override
  List<Object?> get props => [messages];
}

class MessageAccErrorState extends MessageAccState {
  final String error;

  MessageAccErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class EditMessageAccLoadingState extends MessageAccState {}

class EditMessageAccLoadedState extends MessageAccState {
  

 
}

class EditMessageAccErrorState extends MessageAccState {
  String errorMessage;
  EditMessageAccErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}