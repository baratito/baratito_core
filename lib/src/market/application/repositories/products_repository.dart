import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/market/application/models/models.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

abstract class ProductsRepository {
  Future<Result<PagedList<ProductModel>, ApplicationFailure>> search(
    PageInfo pageInfo,
    String query, [
    Category? category,
  ]);
  Future<Result<List<ProductModel>, ApplicationFailure>> getRecommendations();
}
