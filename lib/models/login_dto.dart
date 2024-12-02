class LoginDTO {
  final String email;
  final String password;
  final bool rememberMe;

  LoginDTO({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'rememberMe': rememberMe,
      };
}
