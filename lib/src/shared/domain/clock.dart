import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ClockModule {
  @lazySingleton
  Clock get clock => Clock();
}
