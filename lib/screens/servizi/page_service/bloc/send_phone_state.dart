part of 'send_phone_bloc.dart';

abstract class SendPhoneState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SendPhoneInitial extends SendPhoneState {}


class SendPhoneLoaded extends SendPhoneState {}


class SendPhoneErrorState extends SendPhoneState {
  final String message;

  SendPhoneErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendPhonLoadingState extends SendPhoneState {}