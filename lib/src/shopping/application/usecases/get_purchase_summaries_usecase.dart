import 'package:result_type/result_type.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/repositories/repositories.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class GetPurchaseSummariesUsecase {
  final PurchaseListsRepository _repository;

  GetPurchaseSummariesUsecase(this._repository);

  Future<Result<List<MonthlyPurchaseSummary>, ApplicationFailure>>
      call() async {
    final result = await _repository.getSummaries();
    if (result.isFailure) return Failure(result.failure);
    final models = result.success;
    final summaries = models.map<MonthlyPurchaseSummary>((model) {
      return model.toEntity();
    }).toList();
    return Success(summaries);
  }
}
