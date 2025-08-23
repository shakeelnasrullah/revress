import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent{ }
class LoginSubmitted extends LoginEvent{ }
class LoginSuccess extends LoginEvent{ }
class LoginFailure extends LoginEvent{ }
class LoginNavigateToSignup extends LoginEvent{ }
class LoginEmailChanged extends LoginEvent{
  final String email;
  LoginEmailChanged(this.email);
}
class LoginPasswordChanged extends LoginEvent{
  final String password;
  LoginPasswordChanged(this.password);
}
class LoginRememberMe extends LoginEvent{
  final bool rememberMe;
  LoginRememberMe(this.rememberMe);
}




