class DataProfileModel {
  final String richiesta;
  final String nome;
  final String cognome;
  final String telefono;
  final String email;
  final String indirizzo;
  final String tipoAiuto;
  final String associazione;

  DataProfileModel({
    required this.richiesta,
    required this.nome,
    required this.cognome,
    required this.telefono,
    required this.email,
    required this.indirizzo,
    required this.tipoAiuto,
    required this.associazione,
  });

  Map<String, dynamic> toJson() {
    return {
      'tipoRichiesta':richiesta,
      'nome': nome,
      'cognome': cognome,
      'telefono': telefono,
      'email': email,
      'indirizzo': indirizzo,
      'numeroComponenti': tipoAiuto,
      'netaComponenti': associazione,
    };
  }
}
