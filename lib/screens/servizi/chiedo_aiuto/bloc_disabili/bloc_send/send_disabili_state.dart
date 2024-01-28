
part of 'send_disabili_bloc.dart';

abstract class SendDisabiliDataState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SendDisabiliDataInitial extends SendDisabiliDataState {}


class SendDisabiliDataLoaded extends SendDisabiliDataState {}


class SendDisabiliDataErrorState extends SendDisabiliDataState {
  final String message;

  SendDisabiliDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendDisabiliDataLoadingState extends SendDisabiliDataState {}