part of 'edit_data_type_service_bloc.dart';

abstract class EditDataTypeServiceState extends Equatable{
  @override
  List<Object?> get props => [];
}

class EditDataTypeServiceInitial extends EditDataTypeServiceState {}


class EditDataTypeServiceLoaded extends EditDataTypeServiceState {
  RequestData data;
  EditDataTypeServiceLoaded({
    required this.data,
  });


    @override
  List<Object?> get props => [data];
}


class EditDataTypeServiceErrorState extends EditDataTypeServiceState {
  final String message;

  EditDataTypeServiceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class EditDataTypeServiceLoadingState extends EditDataTypeServiceState {}