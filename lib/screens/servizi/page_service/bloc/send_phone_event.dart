part of 'send_phone_bloc.dart';

abstract class SendPhoneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendPhoneFormEvent extends SendPhoneEvent {
   String telefono;
 
  SendPhoneFormEvent({
    required this.telefono,   
  });
  @override
  List<Object?> get props => [telefono];
}
