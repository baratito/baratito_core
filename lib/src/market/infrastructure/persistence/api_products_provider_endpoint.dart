import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiProductsProviderEndpoint extends ApiProviderEndpoint {
  const ApiProductsProviderEndpoint() : super('products/');
}
