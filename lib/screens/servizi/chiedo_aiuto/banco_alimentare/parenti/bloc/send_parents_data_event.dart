part of 'send_parents_data_bloc.dart';

abstract class SendParentsDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable

class SendParentsNumberFormEvent extends SendParentsDataEvent {
   String numeroComponenti;
 
  SendParentsNumberFormEvent({
    required this.numeroComponenti,
   
  });
  @override
  List<Object?> get props => [numeroComponenti, ];
}
class SendParentsDisabileFormEvent extends SendParentsDataEvent {
   String numeroDisabili;
  String disabile;
 
  SendParentsDisabileFormEvent({
    required this.numeroDisabili,
    required this.disabile,
   
  });
  @override
  List<Object?> get props => [numeroDisabili, disabile, ];
}
// ignore: must_be_immutable
class SendParentsFormEvent extends SendParentsDataEvent {
 
  String nomeParente;
  String anniParente;
  String gradoParente;
  SendParentsFormEvent({

    required this.nomeParente,
    required this.anniParente,
    required this.gradoParente,
  });
  @override
  List<Object?> get props => [nomeParente, anniParente, gradoParente];
}
 
