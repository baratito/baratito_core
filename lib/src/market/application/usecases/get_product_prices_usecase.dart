import 'package:baratito_core/src/market/application/repositories/repositories.dart';
import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class GetProductPricesUsecase {
  final PricesRepository _repository;

  GetProductPricesUsecase(this._repository);

  Future<Result<List<Price>, ApplicationFailure>> call({
    required Product product,
  }) async {
    final result = await _repository.getByProduct(product);
    if (result.isFailure) return Failure(result.failure);
    final priceModels = result.success;
    final prices = priceModels.map<Price>((model) => model.toEntity()).toList();
    prices.sort((a, b) {
      return a.value.compareTo(b.value);
    });
    return Success(prices);
  }
}
