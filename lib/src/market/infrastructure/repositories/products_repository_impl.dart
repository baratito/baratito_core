import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/market/infrastructure/persistence/persistence.dart';
import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final RemoteProductsProvider _provider;

  ProductsRepositoryImpl(this._provider);

  @override
  Future<Result<PagedList<ProductModel>, ApplicationFailure>> search(
    PageInfo pageInfo,
    String query, [
    Category? category,
  ]) async {
    try {
      final results = await _provider.search(pageInfo, query, category);
      return Success(results);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  ApplicationFailure _parseException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure();
    } else if (exception is ConnectionException) {
      return ConnectionFailure();
    } else if (exception is NotFoundException) {
      return NotFoundFailure();
    }

    throw Exception('Unexpected exception');
  }
}
