part of 'send_parents_data_bloc.dart';

abstract class SendParentsDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendParentsNumberFormEvent extends SendParentsDataEvent {
   String numeroComponenti;
  String disabile;
 
  SendParentsNumberFormEvent({
    required this.numeroComponenti,
    required this.disabile,
   
  });
  @override
  List<Object?> get props => [numeroComponenti, disabile, ];
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
 
