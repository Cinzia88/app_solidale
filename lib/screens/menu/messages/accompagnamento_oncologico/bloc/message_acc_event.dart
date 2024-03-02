part of 'message_acc_bloc.dart';

abstract class MessageAccEvent extends Equatable {
  const MessageAccEvent();
}

class FetchMessageAccEvent extends MessageAccEvent {
  @override
  List<Object> get props => [];
}

class EditMessageAccEvent extends MessageAccEvent {
  String idMessage;
  String serviceId;
  String data;
  String risposta;

  EditMessageAccEvent({
    required this.idMessage,
    required this.serviceId,
    required this.data,
    required this.risposta,
  });
  @override
  List<Object?> get props => [idMessage, serviceId, data, risposta];
}
