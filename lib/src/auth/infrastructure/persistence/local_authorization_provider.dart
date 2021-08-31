import 'package:optional/optional.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';

abstract class LocalAuthorizationProvider {
  Future<void> saveCredentials(AuthorizationCredentials credentials);
  Future<Optional<AuthorizationCredentials>> getCredentials();
  Future<void> removeCredentials();
}
