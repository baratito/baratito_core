import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shopping/application/models/models.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class UpdateShoppingListItemsUsecase {
  final ShoppingListsRepository _repository;

  UpdateShoppingListItemsUsecase(this._repository);

  Future<Result<List<ShoppingListItem>, ApplicationFailure>> call({
    required ShoppingList shoppingList,
    required List<ShoppingListItem> shoppingListItems,
  }) async {
    final updateModels = shoppingListItems.map<ShoppingListItemUpdateModel>(
      (entity) {
        return ShoppingListItemUpdateModel(
          id: entity.id,
          product: ProductModel.fromEntity(entity.product),
          quantity: entity.quantity,
        );
      },
    ).toList();
    final result = await _repository.updateItems(
      shoppingList,
      updateModels,
    );
    if (result.isFailure) return Failure(result.failure);
    final shoppingListItemModels = result.success;
    final updatedShoppingListItems = shoppingListItemModels
        .map<ShoppingListItem>((model) => model.toEntity())
        .toList();
    return Success(updatedShoppingListItems);
  }
}
