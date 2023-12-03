class ParentsData {
  final String nome;
  final String anni;
  final String grado;

  ParentsData(this.nome, this.anni, this.grado);
  @override
  String toString() {
    return 'nome: $nome, anni: $anni, grado: $grado';
  }
}