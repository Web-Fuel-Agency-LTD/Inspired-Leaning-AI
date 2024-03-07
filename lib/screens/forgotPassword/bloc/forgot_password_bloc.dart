import 'package:bloc/bloc.dart';
import 'package:inspired_learning_ai/screens/forgotPassword/bloc/forgot_password_event.dart';
import 'package:inspired_learning_ai/screens/forgotPassword/bloc/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordInitial());

  void forgotPassword() {
    // Implement logic to send forgot password email
  }

  void dispose() {
    // Clean up resources when the bloc is disposed
  }
}
