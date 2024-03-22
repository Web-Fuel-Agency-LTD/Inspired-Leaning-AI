class AccountState {
  const AccountState();
}

class InitialAccountState extends AccountState {
  const InitialAccountState();
}

class LoadingAccountState extends AccountState {
  const LoadingAccountState();
}

class AccountSuccessState extends AccountState {
  const AccountSuccessState();
}

class AccountErrorState extends AccountState {
  final String errorMessage;

  const AccountErrorState(this.errorMessage);
}
