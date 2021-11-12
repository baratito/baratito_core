import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/persistence.dart';

@LazySingleton(as: ShoppingListsRepository)
class ShoppingListsRespositoryImpl implements ShoppingListsRepository {
  final RemoteShoppingListsProvider _remoteProvider;

  ShoppingListsRespositoryImpl(this._remoteProvider);

  @override
  Future<Result<List<ShoppingListModel>, ApplicationFailure>> getAll() async {
    try {
      final shoppingListModels = await _remoteProvider.getAll();
      return Success(shoppingListModels);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<ShoppingListModel, ApplicationFailure>> create(
    ShoppingListCreateModel model,
  ) async {
    try {
      final shoppingListModel = await _remoteProvider.create(model);
      return Success(shoppingListModel);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<ShoppingListModel, ApplicationFailure>> update(
    ShoppingListUpdateModel model,
  ) async {
    try {
      final shoppingListModel = await _remoteProvider.update(model);
      return Success(shoppingListModel);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<Null, ApplicationFailure>> delete(
    ShoppingList shoppingList,
  ) async {
    try {
      await _remoteProvider.delete(shoppingList);
      return Success(null);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<List<ShoppingListItemModel>, ApplicationFailure>> updateItems(
    ShoppingList shoppingList,
    List<ShoppingListItemUpdateModel> models,
  ) async {
    try {
      final shoppingListItemModels = await _remoteProvider.updateItems(
        shoppingList,
        models,
      );
      return Success(shoppingListItemModels);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<List<ShoppingListItemModel>, ApplicationFailure>> getItems(
    ShoppingList shoppingList,
  ) async {
    try {
      final shoppingListItemModels = await _remoteProvider.getItems(
        shoppingList,
      );
      return Success(shoppingListItemModels);
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
