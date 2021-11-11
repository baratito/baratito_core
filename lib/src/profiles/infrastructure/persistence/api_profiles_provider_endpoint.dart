import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiProfilesProviderEndpoint extends ApiProviderEndpoint {
  const ApiProfilesProviderEndpoint() : super('profile/');
}
