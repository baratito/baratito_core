import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/authorization_credentials_serializer.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/remote_authorization_refresher.dart';
import 'package:baratito_core/src/configs/configs.dart';
import 'package:baratito_core/src/shared/shared.dart';

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
    final endpoint = '${Constants.apiBaseUrl}refresh_token/';
    final uri = Uri.parse(endpoint);

    final credentialsMap = _authorizationCredentialsSerializer.toMap(
      credentials,
    );

    final headers = {'Content-Type': 'application/json'};
    final newCredentialsMap = await _apiClient.post(
      uri,
      body: credentialsMap,
      headers: headers,
    );
    final newCredentials = _authorizationCredentialsSerializer.fromMap(
      newCredentialsMap,
    );

    return newCredentials;
  }
}
