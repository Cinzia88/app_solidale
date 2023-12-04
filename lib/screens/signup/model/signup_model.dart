class SignUpModel {
  final String name;
  final String email;

  final String telefono;
  final String password;
  final String confirmPassword;
  SignUpModel({
    required this.name,
    required this.email,
    required this.telefono,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'email': email,
      'telefono': telefono,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
