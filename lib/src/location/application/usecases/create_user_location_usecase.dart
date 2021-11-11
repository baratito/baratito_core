import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/location/application/models/models.dart';
import 'package:baratito_core/src/location/application/repositories/repositories.dart';
import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class CreateUserLocationUsecase {
  final UserLocationsRepository _repository;

  CreateUserLocationUsecase(this._repository);

  Future<Result<UserLocation, ApplicationFailure>> call({
    required MapLocation mapLocation,
  }) async {
    final createModel = UserLocationCreateModel(
      name: mapLocation.name,
      address: mapLocation.address,
      location: mapLocation.location,
      country: mapLocation.country,
      city: mapLocation.city,
      enabled: true,
    );
    final result = await _repository.create(createModel);
    if (result.isFailure) return Failure(result.failure);
    final userLocationModel = result.success;
    final userLocation = userLocationModel.toEntity();
    return Success(userLocation);
  }
}
