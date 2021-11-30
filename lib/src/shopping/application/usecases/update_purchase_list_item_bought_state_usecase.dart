import 'package:baratito_core/src/shopping/application/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class UpdatePurchaseListItemBoughtStateUsecase {
  final PurchaseListItemsRepository _repository;

  UpdatePurchaseListItemBoughtStateUsecase(this._repository);

  Future<Result<PurchaseListItem, ApplicationFailure>> call({
    required PurchaseListItem purchaseListItem,
    required bool isBought,
  }) async {
    final updateModel = PurchaseListItemUpdateModel(
      id: purchaseListItem.id,
      isBought: isBought,
    );
    final result = await _repository.update(updateModel);
    if (result.isFailure) return Failure(result.failure);
    final updatedModel = result.success;
    final updatedEntity = updatedModel.toEntity();
    return Success(updatedEntity);
  }
}
