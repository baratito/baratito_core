import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/auth/application/application.dart';
import 'package:baratito_core/src/auth/domain/authorization_credentials.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/persistence.dart';

@Singleton(as: AuthorizationRepository)
class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final LocalAuthorizationProvider _localAuthorizationProvider;

  AuthorizationRepositoryImpl(this._localAuthorizationProvider);

  @override
  Future<void> saveCredentials(AuthorizationCredentials credentials) {
    return _localAuthorizationProvider.saveCredentials(credentials);
  }

  @override
  Future<Optional<AuthorizationCredentials>> getCredentials() {
    return _localAuthorizationProvider.getCredentials();
  }
}
