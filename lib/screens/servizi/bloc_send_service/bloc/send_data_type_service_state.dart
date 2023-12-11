part of 'send_data_type_service_bloc.dart';

abstract class SendDataTypeServiceState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SendDataTypeServiceInitial extends SendDataTypeServiceState {}


class SendDataTypeServiceLoaded extends SendDataTypeServiceState {
 
}


class SendDataTypeServiceErrorState extends SendDataTypeServiceState {
  final String message;

  SendDataTypeServiceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendDataTypeServiceLoadingState extends SendDataTypeServiceState {}