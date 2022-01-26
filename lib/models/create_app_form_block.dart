import 'package:rxdart/rxdart.dart';

class ServiceManager {
  BehaviorSubject<String> description =
      BehaviorSubject<String>.seeded('this is a description');
  BehaviorSubject<int> timeCost = BehaviorSubject<int>.seeded(0);

  Stream<String> get description$ => description.stream;
  Stream<int> get timeCost$ => timeCost.stream;

  int get inTimeCost => timeCost.value;
  String get inDescription => description.value;

  void addDescrition(String des) => description.add(des);
  void addTimeCost(int time) => timeCost.add(time);
}
