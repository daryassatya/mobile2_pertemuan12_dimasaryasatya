part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InitLogin extends LoginEvent {
  const InitLogin();

  // No need to override props since it's empty
}

class ProsesLogin extends LoginEvent {
  final String username;
  final String password;

  const ProsesLogin({this.username = "", this.password = ""});

  @override
  List<Object> get props => [username, password];
}

class ProsesLogout extends LoginEvent {
  const ProsesLogout();

  // No need to override props since it's empty
}
