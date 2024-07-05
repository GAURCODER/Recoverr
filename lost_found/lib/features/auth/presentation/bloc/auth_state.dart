part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {
  final User user;
  AuthSignUpSuccess(this.user);
}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}

class AuthLoginSuccess extends AuthState {
  final User user;
  AuthLoginSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class AuthSignUpFailure extends AuthState {
  final String message;
  AuthSignUpFailure(this.message);
}

class AuthLoginFailure extends AuthState {
  final String message;
  AuthLoginFailure(this.message);
}

class AuthLogout extends AuthState {}
