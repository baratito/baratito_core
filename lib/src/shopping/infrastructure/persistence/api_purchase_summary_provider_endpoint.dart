import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiPurchaseSummaryProviderEndpoint extends ApiProviderEndpoint {
  const ApiPurchaseSummaryProviderEndpoint() : super('purchase_summary/');
}
