import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String nome;
  final String email;
  final String richiesta;

  const UserData({
    required this.id,
    required this.nome,
    required this.email,
    required this.richiesta,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"].toString(),
      nome: json["name"],
      email: json["email"],
      richiesta: json["richiesta"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        email,
        richiesta,
      ];
}
