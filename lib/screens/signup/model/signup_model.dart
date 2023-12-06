class SignUpModel {
  final String name;
  final String email;
  final String indirizzo;
  final String telefono;
  final String password;
  final String confirmPassword;
  SignUpModel({
    required this.name,
    required this.email,
    required this.indirizzo,
    required this.telefono,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'email': email,
      'indirizzo': indirizzo,
      'telefono': telefono,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
