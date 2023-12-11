import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String nome;
  final String indirizzo;
  final String telefono;
  final String email;
  final int verified;

  const UserData({
    required this.id,
    required this.nome,
    required this.indirizzo,
    required this.telefono,
    required this.email,
    required this.verified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"].toString(),
      nome: json["name"].toString(),
      indirizzo: json["indirizzo"].toString(),
      telefono: json["telefono"].toString(),
      email: json["email"].toString(),
      verified: json["is_verified"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        email,
      ];
}
