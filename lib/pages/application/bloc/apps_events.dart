abstract class AppEvent {
  AppEvent();
}

class TriggerAppEvent extends AppEvent {
  final int index;

  TriggerAppEvent(this.index) : super();
}
