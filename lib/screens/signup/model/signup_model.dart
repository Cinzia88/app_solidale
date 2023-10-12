

class SignUpModel {
  final String email;
    final String password;
  final String confirmPassword;
  SignUpModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmation_password': confirmPassword
    };
  }

}
