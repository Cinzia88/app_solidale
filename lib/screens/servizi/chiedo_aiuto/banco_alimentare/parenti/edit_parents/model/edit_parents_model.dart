import 'package:equatable/equatable.dart';

class ParentsData extends Equatable {
  final String id;
  final String nome;
   String? dataDiNascita;
  final String grado;

   ParentsData(
      {required this.id,
      required this.nome,
       this.dataDiNascita,
      required this.grado});

  factory ParentsData.fromJson(Map<String, dynamic> json) {
    return ParentsData(
      id: json["id"].toString(),
      nome: json["nome"].toString(),
      dataDiNascita: json["data_di_nascita"].toString(),
      grado: json["grado"].toString(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        dataDiNascita,
        grado,
      ];
}
