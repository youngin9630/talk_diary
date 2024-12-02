class Users {
  final String uid;
  final String email;
  final String username;
  final String password;
  final String? phoneNumber;

  Users({
    required this.uid,
    required this.email,
    required this.username,
    required this.password,
    this.phoneNumber,
  });

  // JSON 직렬화
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
        'username': username,
        'phoneNumber': phoneNumber,
      };

  // JSON 역직렬화
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      uid: json['uid'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
    );
  }

  // 로그인용 Map 생성
  Map<String, dynamic> toLoginJson() => {
        'email': email,
        'password': password,
      };
}
