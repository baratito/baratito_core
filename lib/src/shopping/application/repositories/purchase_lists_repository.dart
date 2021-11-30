import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/models/models.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

abstract class PurchaseListsRepository {
  Future<Result<PurchaseListModel, ApplicationFailure>> completePurchase(
    PurchaseList purchaseList,
  );
  Future<Result<List<MonthlyPurchaseSummaryModel>, ApplicationFailure>>
      getSummaries();
}
