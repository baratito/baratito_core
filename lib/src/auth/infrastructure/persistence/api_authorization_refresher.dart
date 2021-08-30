import 'package:baratito_core/src/shared/shared.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/authorization_credentials_serializer.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/remote_authorization_refresher.dart';

@Singleton(as: RemoteAuthorizationRefresher)
class ApiAuthorizationRefresher implements RemoteAuthorizationRefresher {
  final ApiClient _apiClient;
  final AuthorizationCredentialsSerializer _authorizationCredentialsSerializer;

  ApiAuthorizationRefresher(
    this._apiClient,
    this._authorizationCredentialsSerializer,
  );

  @override
  Future<AuthorizationCredentials> refresh(
    AuthorizationCredentials credentials,
  ) async {
    final endpoint = 'https://api.baratito.app/api/refresh_token/';
    final uri = Uri.dataFromString(endpoint);

    final credentialsMap = _authorizationCredentialsSerializer.toMap(
      credentials,
    );

    final newCredentialsMap = await _apiClient.post(uri, body: credentialsMap);
    final newCredentials = _authorizationCredentialsSerializer.fromMap(
      newCredentialsMap,
    );

    return newCredentials;
  }
}
