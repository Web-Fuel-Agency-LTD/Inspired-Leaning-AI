import 'package:bloc/bloc.dart';
import 'package:inspired_learning_ai/screens/account/bloc/account_event.dart';
import 'package:inspired_learning_ai/screens/account/bloc/account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const InitialAccountState());

  void logout() {
    // Implement logic to logout user
  }

  void dispose() {
    // Clean up resources when the bloc is disposed
  }

  void updateProfile() {
    // Implement logic to update user profile
  }

  void deleteAccount() {
    // Implement logic to delete user account
  }

  void changePassword() {
    // Implement logic to change user password
  }

  void changeEmail() {
    // Implement logic to change user email
  }
}
