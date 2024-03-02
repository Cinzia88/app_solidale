part of 'message_taxi_bloc.dart';


abstract class MessageTaxiState extends Equatable {
   @override
  List<Object?> get props => [];
}

class MessageTaxiLoadingState extends MessageTaxiState {
 
}

class MessageTaxiLoadedState extends MessageTaxiState {
  final MessageModelTaxi messages;

  MessageTaxiLoadedState(this.messages);

  @override
  List<Object?> get props => [messages];
}

class MessageTaxiErrorState extends MessageTaxiState {
  final String error;

  MessageTaxiErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class EditMessageTaxiLoadingState extends MessageTaxiState {}

class EditMessageTaxiLoadedState extends MessageTaxiState {
  

 
}

class EditMessageTaxiErrorState extends MessageTaxiState {
  String errorMessage;
  EditMessageTaxiErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}