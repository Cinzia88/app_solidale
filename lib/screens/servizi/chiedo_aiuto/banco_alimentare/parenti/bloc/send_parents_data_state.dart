part of 'send_parents_data_bloc.dart';

abstract class SendParentsDataState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SendParentsDataInitialState extends SendParentsDataState {}


class SendParentsDataLoadedState extends SendParentsDataState {}


class SendParentsDataErrorState extends SendParentsDataState {
  final String message;

  SendParentsDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendParentsDataLoadingState extends SendParentsDataState {}