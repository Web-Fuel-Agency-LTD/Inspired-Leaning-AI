class SignupState {
  const SignupState();
}

class InitialSignupState extends SignupState {
  const InitialSignupState();
}

class LoadingSignupState extends SignupState {
  const LoadingSignupState();
}

class SignupSuccessState extends SignupState {
  const SignupSuccessState();
}

class SignupErrorState extends SignupState {
  final String errorMessage;

  const SignupErrorState(this.errorMessage);
}
