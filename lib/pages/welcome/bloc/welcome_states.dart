class WelcomeStates{
  int counter;
  WelcomeStates({required this.counter});
}

class InitStates extends WelcomeStates {
	InitStates(): super (counter: -2);
  }