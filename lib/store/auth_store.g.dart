// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$usernameInputAtom =
      Atom(name: '_AuthStore.usernameInput', context: context);

  @override
  String get usernameInput {
    _$usernameInputAtom.reportRead();
    return super.usernameInput;
  }

  @override
  set usernameInput(String value) {
    _$usernameInputAtom.reportWrite(value, super.usernameInput, () {
      super.usernameInput = value;
    });
  }

  late final _$passwordInputAtom =
      Atom(name: '_AuthStore.passwordInput', context: context);

  @override
  String get passwordInput {
    _$passwordInputAtom.reportRead();
    return super.passwordInput;
  }

  @override
  set passwordInput(String value) {
    _$passwordInputAtom.reportWrite(value, super.passwordInput, () {
      super.passwordInput = value;
    });
  }

  late final _$signUpUsernameInputAtom =
      Atom(name: '_AuthStore.signUpUsernameInput', context: context);

  @override
  String get signUpUsernameInput {
    _$signUpUsernameInputAtom.reportRead();
    return super.signUpUsernameInput;
  }

  @override
  set signUpUsernameInput(String value) {
    _$signUpUsernameInputAtom.reportWrite(value, super.signUpUsernameInput, () {
      super.signUpUsernameInput = value;
    });
  }

  late final _$signUpPasswordInputAtom =
      Atom(name: '_AuthStore.signUpPasswordInput', context: context);

  @override
  String get signUpPasswordInput {
    _$signUpPasswordInputAtom.reportRead();
    return super.signUpPasswordInput;
  }

  @override
  set signUpPasswordInput(String value) {
    _$signUpPasswordInputAtom.reportWrite(value, super.signUpPasswordInput, () {
      super.signUpPasswordInput = value;
    });
  }

  late final _$signUpConfirmPasswordInputAtom =
      Atom(name: '_AuthStore.signUpConfirmPasswordInput', context: context);

  @override
  String get signUpConfirmPasswordInput {
    _$signUpConfirmPasswordInputAtom.reportRead();
    return super.signUpConfirmPasswordInput;
  }

  @override
  set signUpConfirmPasswordInput(String value) {
    _$signUpConfirmPasswordInputAtom
        .reportWrite(value, super.signUpConfirmPasswordInput, () {
      super.signUpConfirmPasswordInput = value;
    });
  }

  late final _$loggedInUserAtom =
      Atom(name: '_AuthStore.loggedInUser', context: context);

  @override
  User? get loggedInUser {
    _$loggedInUserAtom.reportRead();
    return super.loggedInUser;
  }

  @override
  set loggedInUser(User? value) {
    _$loggedInUserAtom.reportWrite(value, super.loggedInUser, () {
      super.loggedInUser = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void setUsernameInput(String username) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setUsernameInput');
    try {
      return super.setUsernameInput(username);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordInput(String password) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setPasswordInput');
    try {
      return super.setPasswordInput(password);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignUpUsernameInput(String username) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setSignUpUsernameInput');
    try {
      return super.setSignUpUsernameInput(username);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignUpPasswordInput(String password) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setSignUpPasswordInput');
    try {
      return super.setSignUpPasswordInput(password);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignUpConfirmPasswordInput(String confirmPassword) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setSignUpConfirmPasswordInput');
    try {
      return super.setSignUpConfirmPasswordInput(confirmPassword);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoggedInUser(User user) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setLoggedInUser');
    try {
      return super.setLoggedInUser(user);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usernameInput: ${usernameInput},
passwordInput: ${passwordInput},
signUpUsernameInput: ${signUpUsernameInput},
signUpPasswordInput: ${signUpPasswordInput},
signUpConfirmPasswordInput: ${signUpConfirmPasswordInput},
loggedInUser: ${loggedInUser}
    ''';
  }
}
