import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/di/di.config.dart';

final _getIt = GetIt.asNewInstance();

@injectableInit
GetIt setUpCoreDependencies(String environment) {
  return $initGetIt(
    _getIt,
    environment: environment,
  );
}

abstract class Environment {
  static const mobile = 'mobile';
  static const web = 'web';
}
