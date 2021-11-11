import 'package:baratito_core/src/location/infrastructure/persistence/persistence.dart';
import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/location/application/application.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: UserLocationsRepository)
class UserLocationsRepositoryImpl implements UserLocationsRepository {
  final RemoteUserLocationsProvider _provider;

  UserLocationsRepositoryImpl(this._provider);

  @override
  Future<Result<List<UserLocationModel>, ApplicationFailure>> getAll() async {
    try {
      final results = await _provider.getAll();
      return Success(results);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<UserLocationModel, ApplicationFailure>> create(
    UserLocationCreateModel model,
  ) async {
    try {
      final result = await _provider.create(model);
      return Success(result);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  @override
  Future<Result<UserLocationModel, ApplicationFailure>> update(
    UserLocationUpdateModel model,
  ) async {
    try {
      final result = await _provider.enable(model);
      return Success(result);
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
