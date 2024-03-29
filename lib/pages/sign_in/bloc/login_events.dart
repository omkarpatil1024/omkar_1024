abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvent extends SignInEvents {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvents {
  final String password;

  PasswordEvent(this.password);
}
