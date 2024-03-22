class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String? user;

  const AuthenticationSuccess({this.user});
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure(this.message);
}
