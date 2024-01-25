part of 'send_taxi_data_bloc.dart';

abstract class SendTaxiDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendFormServiceEvent extends SendTaxiDataEvent {
    String serviceId;
  String nome;
  String telefono;
    String? partenza;
  String? destinazione;

   SendFormServiceEvent({
    required this.serviceId,
    required this.nome,
    required this.telefono,
     this.partenza,
     this.destinazione,
  });
  @override
  List<Object?> get props => [serviceId, nome, telefono, partenza, destinazione];
}

// ignore: must_be_immutable
class SendDisabiliFormEvent extends SendTaxiDataEvent {
 String numeroDisabili;
  int disabile; 
  SendDisabiliFormEvent({
 required this.numeroDisabili,
    required this.disabile,   
  });
  @override
  List<Object?> get props => [numeroDisabili, disabile,];
}



