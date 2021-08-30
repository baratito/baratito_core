import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

abstract class AuthenticationRepository<A extends AuthenticationCredentials> {
  Future<Result<AuthorizationCredentials, ApplicationFailure>> authenticate(
    A credentials,
  );
}
