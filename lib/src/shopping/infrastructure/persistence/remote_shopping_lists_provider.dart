import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

abstract class RemoteShoppingListsProvider {
  Future<List<ShoppingListModel>> getAll();
  Future<ShoppingListModel> create(ShoppingListCreateModel model);
  Future<ShoppingListModel> update(ShoppingListUpdateModel model);
  Future<void> delete(ShoppingList shoppingList);
  Future<List<ShoppingListItemModel>> updateItems(
    ShoppingList shoppingList,
    List<ShoppingListItemUpdateModel> models,
  );
  Future<List<ShoppingListItemModel>> getItems(ShoppingList shoppingList);
  Future<PurchaseListModel> startPurchase(
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  );
}
