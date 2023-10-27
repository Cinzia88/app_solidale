class DataProfileModel {
  final String nome;
  final String cognome;
  final String telefono;
  final String email;
  final String indirizzo;
  final String numeroComponenti;
  final String etaComponenti;
  final bool presenzaDisabilita;

  DataProfileModel({
    required this.nome,
    required this.cognome,
    required this.telefono,
    required this.email,
    required this.indirizzo,
    required this.numeroComponenti,
    required this.etaComponenti,
    required this.presenzaDisabilita,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cognome': cognome,
      'telefono': telefono,
      'email': email,
      'indirizzo': indirizzo,
      'numeroComponenti': numeroComponenti,
      'netaComponenti': etaComponenti,
      'presenzaDisabilita': presenzaDisabilita,
    };
  }
}
