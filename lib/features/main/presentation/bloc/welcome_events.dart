class WelcomeEvent {}

class PageChanged extends WelcomeEvent {
  final int pageIndex;

  PageChanged(this.pageIndex);
}
