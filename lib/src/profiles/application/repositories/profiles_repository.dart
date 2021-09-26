import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/profiles/application/models/models.dart';
import 'package:baratito_core/src/shared/shared.dart';

abstract class ProfilesRepository {
  Future<Result<ProfileModel, ApplicationFailure>>
      getAuthenticatedUserProfile();
}
