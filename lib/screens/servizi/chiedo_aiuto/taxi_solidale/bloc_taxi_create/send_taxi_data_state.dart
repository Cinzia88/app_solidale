part of 'send_taxi_data_bloc.dart';

abstract class SendTaxiDataState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SendTaxiDataInitial extends SendTaxiDataState {}


class SendTaxiDataLoaded extends SendTaxiDataState {}


class SendTaxiDataErrorState extends SendTaxiDataState {
  final String message;

  SendTaxiDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendTaxiDataLoadingState extends SendTaxiDataState {}



class SendDataDisabiliLoaded extends SendTaxiDataState {
 
}


class SendDataDisabiliErrorState extends SendTaxiDataState {
  final String message;

  SendDataDisabiliErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendDataDisabiliLoadingState extends SendTaxiDataState {}