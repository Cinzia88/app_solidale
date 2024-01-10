import 'package:equatable/equatable.dart';

class DocsData extends Equatable {
  final String id;
  final String nome;
   final String path;
  final String mime;

   DocsData(
      {required this.id,
      required this.nome,
      required this.path,
      required this.mime});

  factory DocsData.fromJson(Map<String, dynamic> json) {
    return DocsData(
      id: json["id"].toString(),
      nome: json["nome"].toString(),
      path: json["path"].toString(),
      mime: json["mime"].toString(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        path,
        mime,
      ];
}
