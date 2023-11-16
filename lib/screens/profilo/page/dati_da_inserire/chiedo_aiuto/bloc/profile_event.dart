part of 'profile_bloc.dart';

abstract class ProfileDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ProfileDataFormEvent extends ProfileDataEvent {
  String richiesta;
  String nome;
  String cognome;
  String email;
  String telefono;
  String indirizzo;
  String citta;
  String provincia;
  String cap;
  String numeroComponenti;
  String etaComponenti;
  String presenzaDisabilita;

  ProfileDataFormEvent({
    required this.richiesta,
    required this.nome,
    required this.cognome,
    required this.email,
    required this.telefono,
    required this.indirizzo,
    required this.citta,
    required this.provincia,
    required this.cap,
    required this.numeroComponenti,
    required this.etaComponenti,
    required this.presenzaDisabilita,
  });
  @override
  List<Object?> get props => [
        richiesta,
        nome,
        cognome,
        email,
        telefono,
        indirizzo,
        citta,
        provincia,
        cap,
        numeroComponenti,
        etaComponenti,
        presenzaDisabilita
      ];
}
