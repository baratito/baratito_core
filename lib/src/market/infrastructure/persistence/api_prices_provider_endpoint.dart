import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiPricesProviderEndpoint extends ApiProviderEndpoint {
  const ApiPricesProviderEndpoint() : super('prices/');
}
