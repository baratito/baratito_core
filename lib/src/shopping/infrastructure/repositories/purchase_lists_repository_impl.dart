import 'package:baratito_core/src/shopping/infrastructure/persistence/persistence.dart';
import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

@LazySingleton(as: PurchaseListsRepository)
class PurchaseListRepositoryImpl implements PurchaseListsRepository {
  final RemotePurchaseListsProvider _remoteProvider;

  PurchaseListRepositoryImpl(this._remoteProvider);

  @override
  Future<Result<PurchaseListModel, ApplicationFailure>> completePurchase(
    PurchaseList purchaseList,
  ) async {
    try {
      final purchaseListModel =
          await _remoteProvider.completePurchase(purchaseList);
      return Success(purchaseListModel);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<List<MonthlyPurchaseSummaryModel>, ApplicationFailure>>
      getSummaries() async {
    try {
      final summaryModels = await _remoteProvider.getSummaries();
      return Success(summaryModels);
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
    } else if (exception is ClientException) {
      return ClientFailure(exception.description);
    }

    throw Exception('Unexpected exception');
  }
}
