class PersonInformationState {
  const PersonInformationState();
}

class PersonInformationInitial extends PersonInformationState {
  const PersonInformationInitial();
}

class PersonInformationLoading extends PersonInformationState {
  const PersonInformationLoading();
}

class PersonInformationSuccess extends PersonInformationState {
  const PersonInformationSuccess();
}

class PersonInformationError extends PersonInformationState {
  final String errorMessage;

  const PersonInformationError(this.errorMessage);
}
