import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class GetShoppingListsUsecase {
  final ShoppingListsRepository _repository;

  GetShoppingListsUsecase(this._repository);

  Future<Result<List<ShoppingList>, ApplicationFailure>> call() async {
    final result = await _repository.getAll();
    if (result.isFailure) return Failure(result.failure);
    final shoppingListModels = result.success;
    final shoppingLists = shoppingListModels.map<ShoppingList>((model) {
      return model.toEntity();
    }).toList();
    return Success(shoppingLists);
  }
}
