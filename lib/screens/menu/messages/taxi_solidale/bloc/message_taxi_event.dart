part of 'message_taxi_bloc.dart';

abstract class MessageTaxiEvent extends Equatable {
  const MessageTaxiEvent();
}

class FetchMessageTaxiEvent extends MessageTaxiEvent {
  @override
  List<Object> get props => [];
}

class EditMessageTaxiEvent extends MessageTaxiEvent {
  String idMessage;
  String serviceId;
  String data;
  String risposta;

  EditMessageTaxiEvent({
    required this.idMessage,
    required this.serviceId,
    required this.data,
    required this.risposta,
  });
  @override
  List<Object?> get props => [idMessage, serviceId, data, risposta];
}
