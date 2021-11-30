import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiPurchaseListItemsProviderEndpoint extends ApiProviderEndpoint {
  const ApiPurchaseListItemsProviderEndpoint() : super('purchase_list_items/');
}
