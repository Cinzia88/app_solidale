part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class FetchMessageEvent extends MessageEvent {
  @override
  List<Object> get props => [];
}

class EditMessageEvent extends MessageEvent {
  String idMessage;
  String serviceId;
  String inviato;
  String dataConsegna;
  String risposta;
  String consegnato;

  EditMessageEvent({
    required this.idMessage,
    required this.serviceId,
    required this.inviato,
    required this.dataConsegna,
    required this.risposta,
    required this.consegnato,
  });
  @override
  List<Object?> get props => [idMessage, serviceId, inviato, dataConsegna, risposta, consegnato, ];
}
