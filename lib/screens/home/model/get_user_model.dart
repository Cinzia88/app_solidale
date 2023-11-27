import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String nome;
  final String email;

  const UserData({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"].toString(),
      nome: json["name"].toString() ,
      email: json["email"].toString(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        email,
      ];
}