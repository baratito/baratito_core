import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/location/application/models/models.dart';
import 'package:baratito_core/src/shared/shared.dart';

abstract class UserLocationsRepository {
  Future<Result<List<UserLocationModel>, ApplicationFailure>> getAll();
  Future<Result<UserLocationModel, ApplicationFailure>> create(
    UserLocationCreateModel model,
  );
  Future<Result<UserLocationModel, ApplicationFailure>> update(
    UserLocationUpdateModel model,
  );
}
