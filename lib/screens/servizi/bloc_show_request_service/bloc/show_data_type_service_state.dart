part of 'show_data_type_service_bloc.dart';

abstract class ShowDataTypeServiceState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ShowDataTypeServiceInitial extends ShowDataTypeServiceState {}


// ignore: must_be_immutable
class ShowDataTypeServiceLoaded extends ShowDataTypeServiceState {
  ServiceReqData data;
  ShowDataTypeServiceLoaded({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}


class ShowDataTypeServiceErrorState extends ShowDataTypeServiceState {
  final String message;

  ShowDataTypeServiceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class ShowDataTypeServiceLoadingState extends ShowDataTypeServiceState {}