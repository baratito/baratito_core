import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class SearchProductsUsecase {
  final ProductsRepository _repository;

  SearchProductsUsecase(this._repository);

  Future<Result<PagedList<Product>, ApplicationFailure>> call({
    required PageInfo pageInfo,
    required String query,
    Category? category,
  }) async {
    final result = await _repository.search(pageInfo, query, category);
    if (result.isFailure) return Failure(result.failure);
    final modelList = result.success;
    final productList = modelList.map<Product>((model) => model.toEntity());
    return Success(productList);
  }
}
