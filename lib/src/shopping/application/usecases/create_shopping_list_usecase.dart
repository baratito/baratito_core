import 'package:baratito_core/src/shopping/application/models/models.dart';
import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class CreateShoppingListUsecase {
  final ShoppingListsRepository _repository;

  CreateShoppingListUsecase(this._repository);

  Future<Result<ShoppingList, ApplicationFailure>> call({
    required String name,
  }) async {
    final createModel = ShoppingListCreateModel(name: name);
    final result = await _repository.create(createModel);
    if (result.isFailure) return Failure(result.failure);
    final shoppingListModel = result.success;
    final shoppingList = shoppingListModel.toEntity();
    return Success(shoppingList);
  }
}
