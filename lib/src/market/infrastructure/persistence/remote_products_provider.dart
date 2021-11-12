import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

abstract class RemoteProductsProvider {
  Future<PagedList<ProductModel>> search(
    PageInfo pageInfo,
    String query, [
    Category? category,
  ]);
  Future<List<ProductModel>> getRecommendations();
}
