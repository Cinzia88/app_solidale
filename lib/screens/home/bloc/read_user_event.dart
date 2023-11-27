part of "read_user_bloc.dart";

abstract class ReadUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserEvent extends ReadUserEvent {}