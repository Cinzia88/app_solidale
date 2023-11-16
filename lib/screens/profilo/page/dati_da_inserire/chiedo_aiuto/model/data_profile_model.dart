class DataProfileModel {
  final String richiesta;
  final String nome;
  final String cognome;
  final String email;
  final String telefono;
  final String indirizzo;
  final String citta;
  final String provincia;
  final String cap;
  final String numeroComponenti;
  final String etaComponenti;
  final String presenzaDisabilita;

  DataProfileModel({
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

  Map<String, dynamic> toJson() {
    return {
      'tipoRichiesta': richiesta,
      'nome': nome,
      'cognome': cognome,
      'email': email,
      'telefono': telefono,
      'indirizzo': indirizzo,
      'citta': citta,
      'provincia': provincia,
      'cap': cap,
      'numeroComponenti': numeroComponenti,
      'netaComponenti': etaComponenti,
      'presenzaDisabilita': presenzaDisabilita,
    };
  }
}
