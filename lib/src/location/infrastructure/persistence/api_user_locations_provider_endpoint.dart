import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiUserLocationsProviderEndpoint extends ApiProviderEndpoint {
  const ApiUserLocationsProviderEndpoint() : super('user_locations/');
}
