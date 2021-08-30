import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/remote_authorization_refresher.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/local_authorization_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@Singleton(as: ApiAuthorizationService)
class ApiAuthorizationServiceImpl implements ApiAuthorizationService {
  final LocalAuthorizationProvider _localAuthorizationProvider;
  final AuthorizationCredentialsExpirationChecker _expirationChecker;
  final RemoteAuthorizationRefresher _remoteAuthorizationRefresher;

  ApiAuthorizationServiceImpl(
    this._localAuthorizationProvider,
    this._expirationChecker,
    this._remoteAuthorizationRefresher,
  );

  @override
  Future<String> getToken() async {
    final credentialsOptional =
        await _localAuthorizationProvider.getCredentials();

    // Reached this point, credentials should always be present,
    // so it's OK for the app to fail otherwhise.
    final credentials = credentialsOptional.value;

    final accessTokenIsExpired = _expirationChecker.accessTokenIsExpired(
      credentials,
    );

    if (accessTokenIsExpired) {
      final newCredentials = await _remoteAuthorizationRefresher.refresh(
        credentials,
      );
      unawaited(_localAuthorizationProvider.saveCredentials(newCredentials));
      return newCredentials.accessToken;
    }

    return credentials.accessToken;
  }
}
