import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/models/models.dart';

abstract class ShoppingListsRepository {
  Future<Result<List<ShoppingListModel>, ApplicationFailure>> getAll();
  Future<Result<ShoppingListModel, ApplicationFailure>> create(
    ShoppingListCreateModel model,
  );
  Future<Result<ShoppingListModel, ApplicationFailure>> update(
    ShoppingListUpdateModel model,
  );
  Future<Result<Null, ApplicationFailure>> delete(ShoppingList shoppingList);
  Future<Result<List<ShoppingListItemModel>, ApplicationFailure>> updateItems(
    ShoppingList shoppingList,
    List<ShoppingListItemUpdateModel> models,
  );
  Future<Result<List<ShoppingListItemModel>, ApplicationFailure>> getItems(
    ShoppingList shoppingList,
  );
  Future<Result<PurchaseListModel, ApplicationFailure>> startPurchase(
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  );
}
