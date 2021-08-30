import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:optional/optional.dart';

abstract class AuthorizationRepository {
  Future<void> saveCredentials(AuthorizationCredentials credentials);
  Future<Optional<AuthorizationCredentials>> getCredentials();
}
