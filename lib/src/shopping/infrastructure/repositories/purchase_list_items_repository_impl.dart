import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/persistence.dart';
import 'package:baratito_core/src/shopping/application/application.dart';

@LazySingleton(as: PurchaseListItemsRepository)
class PurchaseListItemsRepositoryImpl implements PurchaseListItemsRepository {
  final RemotePurchaseListItemsProvider _remoteProvider;

  PurchaseListItemsRepositoryImpl(this._remoteProvider);

  @override
  Future<Result<PurchaseListItemModel, ApplicationFailure>> update(
    PurchaseListItemUpdateModel updateModel,
  ) async {
    try {
      final updatedModel = await _remoteProvider.update(updateModel);
      return Success(updatedModel);
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
