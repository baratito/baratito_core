import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

abstract class AuthorizationRepository {
  Future<void> saveCredentials(AuthorizationCredentials credentials);
  Future<Result<AuthorizationCredentials, ApplicationFailure>> getCredentials();
  Future<void> removeCredentials();
}
