import 'package:bloc/bloc.dart';
import 'package:inspired_learning_ai/features/user/presentation/bloc/person_information_event.dart';
import 'package:inspired_learning_ai/features/user/presentation/bloc/person_information_state.dart';

class PersonInformationBloc
    extends Bloc<PersonInformationEvent, PersonInformationState> {
  PersonInformationBloc() : super(const PersonInformationInitial());

  void savePersonalInformation() {
    // Implement logic to save personal information
  }

  void dispose() {
    // Clean up resources when the bloc is disposed
  }

  void updatePersonalInformation() {
    // Implement logic to update personal information
  }

  void deletePersonalInformation() {
    // Implement logic to delete personal information
  }

  void changePassword() {
    // Implement logic to change user password
  }

  void changeEmail() {
    // Implement logic to change user email
  }

  void logout() {
    // Implement logic to logout user
  }
}
