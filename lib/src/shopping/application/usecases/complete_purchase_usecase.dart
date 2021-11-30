import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class CompletePurchaseUsecase {
  final PurchaseListsRepository _repository;

  CompletePurchaseUsecase(this._repository);

  Future<Result<PurchaseList, ApplicationFailure>> call({
    required PurchaseList purchaseList,
  }) async {
    final result = await _repository.completePurchase(purchaseList);
    if (result.isFailure) return Failure(result.failure);
    final purchaseListModel = result.success;
    final updatedPurchaseList = purchaseListModel.toEntity();
    return Success(updatedPurchaseList);
  }
}
