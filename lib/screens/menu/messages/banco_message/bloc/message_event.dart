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
    String dataInvio;
  String dataConsegna;
  String risposta;
  String consegnato;

  EditMessageEvent({
    required this.idMessage,
    required this.serviceId,
        required this.dataInvio,
    required this.dataConsegna,
    required this.risposta,
    required this.consegnato,
  });
  @override
  List<Object?> get props => [idMessage, serviceId, dataInvio, dataConsegna, risposta, consegnato, ];
}
