import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class DeleteShoppingListUsecase {
  final ShoppingListsRepository _repository;

  DeleteShoppingListUsecase(this._repository);

  Future<Result<Null, ApplicationFailure>> call({
    required ShoppingList shoppingList,
  }) async {
    final result = await _repository.delete(shoppingList);
    if (result.isFailure) return Failure(result.failure);
    return Success(null);
  }
}
