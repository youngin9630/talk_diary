abstract class User {
  final String _username; // private 필드
  final String _password; // private 필드

  User(this._username, this._password);

  String get username => _username; // 읽기 전용 getter 제공
  String get password => _password; // 읽기 전용 getter 제공
}
