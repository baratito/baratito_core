import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/location/application/models/models.dart';
import 'package:baratito_core/src/location/application/repositories/repositories.dart';
import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class EnableUserLocationUsecase {
  final UserLocationsRepository _repository;

  EnableUserLocationUsecase(this._repository);

  Future<Result<UserLocation, ApplicationFailure>> call({
    required UserLocation userLocation,
  }) async {
    final updateModel = UserLocationUpdateModel(
      id: userLocation.id,
      enabled: true,
    );
    final result = await _repository.update(updateModel);
    if (result.isFailure) return Failure(result.failure);
    final userLocationModel = result.success;
    final updatedUserLocation = userLocationModel.toEntity();
    return Success(updatedUserLocation);
  }
}
