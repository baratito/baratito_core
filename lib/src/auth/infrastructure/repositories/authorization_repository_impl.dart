import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/auth/application/application.dart';
import 'package:baratito_core/src/auth/domain/authorization_credentials.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/persistence.dart';
import 'package:baratito_core/src/shared/shared.dart';

@Singleton(as: AuthorizationRepository)
class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final LocalAuthorizationProvider _localAuthorizationProvider;

  AuthorizationRepositoryImpl(this._localAuthorizationProvider);

  @override
  Future<void> saveCredentials(AuthorizationCredentials credentials) {
    return _localAuthorizationProvider.saveCredentials(credentials);
  }

  @override
  Future<Result<AuthorizationCredentials, ApplicationFailure>>
      getCredentials() async {
    final optional = await _localAuthorizationProvider.getCredentials();
    if (optional.isEmpty) {
      return Failure(NotFoundFailure());
    }
    return Success(optional.value);
  }

  @override
  Future<void> removeCredentials() {
    return _localAuthorizationProvider.removeCredentials();
  }
}
