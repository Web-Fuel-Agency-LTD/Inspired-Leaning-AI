import 'package:bloc/bloc.dart';
import 'package:inspired_learning_ai/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:inspired_learning_ai/features/authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
