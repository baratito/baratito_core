import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

@lazySingleton
class StartPurchaseUsecase {
  final ShoppingListsRepository _repository;

  StartPurchaseUsecase(this._repository);

  Future<Result<PurchaseList, ApplicationFailure>> call({
    required ShoppingList shoppingList,
    required PurchaseSettings purchaseSettings,
  }) async {
    final result = await _repository.startPurchase(
      shoppingList,
      purchaseSettings,
    );
    if (result.isFailure) return Failure(result.failure);
    final purchaseListModel = result.success;
    final purchaseList = purchaseListModel.toEntity();
    return Success(purchaseList);
  }
}
