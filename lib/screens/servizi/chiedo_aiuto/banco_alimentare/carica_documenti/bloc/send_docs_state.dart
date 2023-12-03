part of 'send_docs_bloc.dart';

abstract class SendDocsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SendDocsInitial extends SendDocsState {}


class SendDocsLoaded extends SendDocsState {}


class SendDocsErrorState extends SendDocsState {
  final String message;

  SendDocsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}




class SendDocsLoadingState extends SendDocsState {}