part of 'edit_disabili_bloc.dart';

abstract class ReadDisabiliEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDisabiliEvent extends ReadDisabiliEvent {}

class EditDisabiliEvent extends ReadDisabiliEvent {
  String id;
  String numeroDisabili;
  int disabile;

  EditDisabiliEvent({
    required this.id,
    required this.numeroDisabili,
    required this.disabile,
  
  });
  @override
  List<Object?> get props =>
      [id, numeroDisabili, disabile,];
}