part of 'profile_offro_aiuto_bloc.dart';


abstract class OffroAiutoDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class OffroAiutoDataFormEvent extends OffroAiutoDataEvent {
  String richiesta;
    String nome;
   String cognome;
   String telefono;
   String email;
   String tipoAiuto;
   String associazione;

  OffroAiutoDataFormEvent({
    required this.richiesta,
    required this.nome,
    required this.cognome,
    required this.telefono,
    required this.email,
    required this.tipoAiuto,
    required this.associazione,
  });
  @override
  List<Object?> get props => [richiesta, nome, cognome, telefono, email, tipoAiuto, associazione, ];
}
 

