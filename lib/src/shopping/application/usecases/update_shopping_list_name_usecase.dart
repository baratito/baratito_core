import 'package:baratito_core/src/shopping/application/models/models.dart';
import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class UpdateShoppingListNameUsecase {
  final ShoppingListsRepository _repository;

  UpdateShoppingListNameUsecase(this._repository);

  Future<Result<ShoppingList, ApplicationFailure>> call({
    required ShoppingList shoppingList,
    required String name,
  }) async {
    final updateModel = ShoppingListUpdateModel(
      id: shoppingList.id,
      name: name,
    );
    final result = await _repository.update(updateModel);
    if (result.isFailure) return Failure(result.failure);
    final shoppingListModel = result.success;
    final updatedShoppingList = shoppingListModel.toEntity();
    return Success(updatedShoppingList);
  }
}
