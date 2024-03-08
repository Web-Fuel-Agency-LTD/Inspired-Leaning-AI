import 'package:bloc/bloc.dart';
import 'package:inspired_learning_ai/screens/checkEmail/bloc/check_email_event.dart';
import 'package:inspired_learning_ai/screens/checkEmail/bloc/check_email_state.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  CheckEmailBloc() : super(const CheckEmailInitial());

  void checkEmail() {
    // Implement logic to check email
  }

  void dispose() {
    // Clean up resources when the bloc is disposed
  }

  void resendCode() {
    // Implement logic to resend code
  }

  void verifyCode() {
    // Implement logic to verify code
  }
}
