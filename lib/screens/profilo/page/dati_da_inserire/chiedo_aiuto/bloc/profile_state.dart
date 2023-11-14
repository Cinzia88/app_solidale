part of 'profile_bloc.dart';

abstract class ProfileDataState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProfileDataInitialState extends ProfileDataState {}

class ProfileDataLoadingState extends ProfileDataState {}

class ProfileDataLoadedState extends ProfileDataState {}


class ProfileDataErrorState extends ProfileDataState {
  final String message;

  ProfileDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}