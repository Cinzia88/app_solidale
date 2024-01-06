part of 'send_disabili_data_bloc.dart';

abstract class SendDisabiliDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable

// ignore: must_be_immutable
class SendDisabiliFormEvent extends SendDisabiliDataEvent {
 String numeroDisabili;
  int disabile; 
  SendDisabiliFormEvent({
 required this.numeroDisabili,
    required this.disabile,   
  });
  @override
  List<Object?> get props => [numeroDisabili, disabile,];
}
