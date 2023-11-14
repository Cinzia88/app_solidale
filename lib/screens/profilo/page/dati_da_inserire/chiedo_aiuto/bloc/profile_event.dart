part of 'profile_bloc.dart';


abstract class ProfileDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ProfileDataFormEvent extends ProfileDataEvent {
    String nome;
   String cognome;
   String telefono;
   String email;
   String indirizzo;
   String numeroComponenti;
   String etaComponenti;
   String presenzaDisabilita;

  ProfileDataFormEvent({
    required this.nome,
    required this.cognome,
    required this.telefono,
    required this.email,
    required this.indirizzo,
    required this.numeroComponenti,
    required this.etaComponenti,
    required this.presenzaDisabilita,
  });
  @override
  List<Object?> get props => [ nome, cognome, telefono, email, indirizzo, numeroComponenti, etaComponenti, presenzaDisabilita];
}
 

