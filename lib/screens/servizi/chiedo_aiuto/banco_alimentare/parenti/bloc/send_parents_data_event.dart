part of 'send_parents_data_bloc.dart';

abstract class SendParentsDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable

// ignore: must_be_immutable
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
  String dataDiNascitaParente;
  String gradoParente;
  SendParentsFormEvent({

    required this.nomeParente,
    required this.dataDiNascitaParente,
    required this.gradoParente,
  });
  @override
  List<Object?> get props => [nomeParente, dataDiNascitaParente, gradoParente];
}
 
