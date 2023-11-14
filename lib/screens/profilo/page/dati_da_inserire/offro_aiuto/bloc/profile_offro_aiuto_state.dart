part of 'profile_offro_aiuto_bloc.dart';

abstract class OffroAiutoDataState extends Equatable{
  @override
  List<Object?> get props => [];
}

class OffroAiutoDataInitialState extends OffroAiutoDataState {}

class OffroAiutoDataLoadingState extends OffroAiutoDataState {}

class OffroAiutoDataLoadedState extends OffroAiutoDataState {}


class OffroAiutoDataErrorState extends OffroAiutoDataState {
  final String message;

  OffroAiutoDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}