import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

abstract class RemotePurchaseListItemsProvider {
  Future<PurchaseListItemModel> update(PurchaseListItemUpdateModel updateModel);
}
