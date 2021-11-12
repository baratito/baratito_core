import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiShoppingListsProviderEndpoint extends ApiProviderEndpoint {
  const ApiShoppingListsProviderEndpoint() : super('lists/');
}
