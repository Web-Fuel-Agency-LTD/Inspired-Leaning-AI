import 'package:bloc/bloc.dart';

part 'login_with_email_cubit_state.dart';

class LoginWithEmailCubit extends Cubit<LoginWithEmailCubitState> {
  LoginWithEmailCubit() : super(LoginWithEmailCubitInitial());

  void validateEmailAndPassword(String email, String password) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    RegExpMatch? emailMatch = emailRegExp.firstMatch(email);

    if (email.isNotEmpty && password.isNotEmpty && emailMatch != null) {
      emit(LoginWithEmailCubitSuccess());
    } else {
      emit(const LoginWithEmailCubitError('Invalid email or password.'));
    }
  }
}
