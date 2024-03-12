part of 'login_with_email_cubit.dart';

class LoginWithEmailCubitState {
  const LoginWithEmailCubitState();
}

final class LoginWithEmailCubitInitial extends LoginWithEmailCubitState {}

final class LoginWithEmailCubitSuccess extends LoginWithEmailCubitState {}

final class LoginWithEmailCubitError extends LoginWithEmailCubitState {
  final String errorMessage;

  const LoginWithEmailCubitError(this.errorMessage);
}
