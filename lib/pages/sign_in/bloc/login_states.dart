class SignInStates {
  final String email;
  final String password;

  SignInStates({this.email = " ", this.password = " "});

  SignInStates copyWith({String? email, String? password}) {
    return SignInStates(email: email ?? this.email, password: password ?? this.password);
  }
}
