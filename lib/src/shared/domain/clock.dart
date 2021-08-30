import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ClockModule {
  @singleton
  Clock get clock => Clock();
}
