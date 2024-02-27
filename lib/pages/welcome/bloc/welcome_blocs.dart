import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspired_learning_ai/pages/welcome/bloc/welcome_events.dart';
import 'package:inspired_learning_ai/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBloc():super(InitStates()){

    on<Increment> ((event, emit) {
			
			emit(WelcomeStates(counter: state.counter+1));
		});

		on<Decrement> ((event, emit) {
			
			emit(WelcomeStates(counter: state.counter-1));
		});

  }
}