abstract class AppEvent {
  const AppEvent();
}

class TrigerAppEvent extends AppEvent {
  final int index;
  const TrigerAppEvent(this.index) : super();
}
