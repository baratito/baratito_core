import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class GetShoppingListItemsUsecase {
  final ShoppingListsRepository _repository;

  GetShoppingListItemsUsecase(this._repository);

  Future<Result<List<ShoppingListItem>, ApplicationFailure>> call({
    required ShoppingList shoppingList,
  }) async {
    final result = await _repository.getItems(shoppingList);
    if (result.isFailure) return Failure(result.failure);
    final shoppingListItemModels = result.success;
    final shoppingListItems = shoppingListItemModels
        .map<ShoppingListItem>((model) => model.toEntity())
        .toList();
    return Success(shoppingListItems);
  }
}
