import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

abstract class RemotePurchaseListsProvider {
  Future<PurchaseListModel> completePurchase(PurchaseList purchaseList);
  Future<List<MonthlyPurchaseSummaryModel>> getSummaries();
}
