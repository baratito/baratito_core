import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiPurchaseListsProviderEndpoint extends ApiProviderEndpoint {
  const ApiPurchaseListsProviderEndpoint() : super('purchase_lists/');
}
