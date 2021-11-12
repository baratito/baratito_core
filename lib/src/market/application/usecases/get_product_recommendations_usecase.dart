import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class GetProductRecommendationsUsecase {
  final ProductsRepository _repository;

  GetProductRecommendationsUsecase(this._repository);

  Future<Result<List<Product>, ApplicationFailure>> call() async {
    final result = await _repository.getRecommendations();
    if (result.isFailure) return Failure(result.failure);
    final modelList = result.success;
    final productList = modelList.map<Product>((model) => model.toEntity());
    return Success(productList.toList());
  }
}
