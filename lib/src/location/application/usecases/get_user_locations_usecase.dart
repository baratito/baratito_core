import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/location/application/repositories/repositories.dart';
import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class GetUserLocationsUsecase {
  final UserLocationsRepository _repository;

  GetUserLocationsUsecase(this._repository);

  Future<Result<List<UserLocation>, ApplicationFailure>> call() async {
    final result = await _repository.getAll();
    if (result.isFailure) return Failure(result.failure);
    final models = result.success;
    final userLocations =
        models.map<UserLocation>((model) => model.toEntity()).toList();
    return Success(userLocations);
  }
}
