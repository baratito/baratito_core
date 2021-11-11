import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/market/infrastructure/persistence/persistence.dart';
import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: PricesRepository)
class PricesRepositoryImpl implements PricesRepository {
  final RemotePricesProvider _provider;

  PricesRepositoryImpl(this._provider);

  @override
  Future<Result<List<PriceModel>, ApplicationFailure>> getByProduct(
    Product product,
  ) async {
    try {
      final results = await _provider.getByProduct(product);
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
