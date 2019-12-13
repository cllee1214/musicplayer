import 'package:event_bus/event_bus.dart';
//事件总线
EventBus eventBus = EventBus();

//需要发送的事件
class PlayEvent {
  var id;
  String url;
  String name;
  PlayEvent(this.id, this.url, this.name);
}

class PopEvent {
  double p = 0;
  String target;
  PopEvent(this.p, this.target);
}