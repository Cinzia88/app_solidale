import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String nome;
  final String indirizzo;
  final String telefono;
  final String email;
  final int verified;
   String token;

   UserData({
    required this.id,
    required this.nome,
    required this.indirizzo,
    required this.telefono,
    required this.email,
    required this.verified,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"].toString(),
      nome: json["name"].toString(),
      indirizzo: json["indirizzo"].toString(),
      telefono: json["telefono"].toString(),
      email: json["email"].toString(),
      verified: json["is_verified"] ?? 0,
      token: json["device_token"].toString()
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        email,
      ];
}
