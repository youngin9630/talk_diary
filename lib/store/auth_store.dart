import 'package:mobx/mobx.dart';
import 'package:talk_diary/data/user.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // Input 상태
  @observable
  String usernameInput = "";

  @observable
  String passwordInput = "";

  @observable
  String signUpUsernameInput = "";

  @observable
  String signUpPasswordInput = "";

  @observable
  String signUpConfirmPasswordInput = "";

  // 로그인한 사용자
  @observable
  User? loggedInUser;

  // 액션 메서드
  @action
  void setUsernameInput(String username) {
    usernameInput = username;
  }

  @action
  void setPasswordInput(String password) {
    passwordInput = password;
  }

  @action
  void setSignUpUsernameInput(String username) {
    signUpUsernameInput = username;
  }

  @action
  void setSignUpPasswordInput(String password) {
    signUpPasswordInput = password;
  }

  @action
  void setSignUpConfirmPasswordInput(String confirmPassword) {
    signUpConfirmPasswordInput = confirmPassword;
  }

  @action
  void setLoggedInUser(User user) {
    loggedInUser = user;
  }
}

final authStore = AuthStore();
