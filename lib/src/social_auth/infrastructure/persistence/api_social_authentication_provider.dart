import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/configs/constants.dart';
import 'package:baratito_core/src/social_auth/domain/domain.dart';
import 'package:baratito_core/src/social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart';
import 'package:baratito_core/src/social_auth/infrastructure/persistence/remote_social_authentication_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemoteSocialAuthenticationProvider)
class ApiSocialAuthenticationProvider
    implements RemoteSocialAuthenticationProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiSocialAuthenticationProviderLoginEndpoint _loginEndpoint;
  final AuthenticationCredentialsSerializer<SocialAuthenticationCredentials>
      _authenticationCredentialsSerializer;
  final AuthorizationCredentialsSerializer _authorizationCredentialsSerializer;

  ApiSocialAuthenticationProvider(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._loginEndpoint,
    this._authenticationCredentialsSerializer,
    this._authorizationCredentialsSerializer,
  );

  @override
  Future<AuthorizationCredentials> authenticate(
    SocialAuthenticationCredentials credentials,
  ) async {
    final endpoint = '${_apiProviderBaseUrl.url}${_loginEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);

    final credentialsMap = _authenticationCredentialsSerializer.toMap(
      credentials,
    );

    final headers = {'Content-Type': 'application/json'};
    final response = await _apiClient.post(
      uri,
      body: credentialsMap,
      headers: headers,
    );

    final authorizationCredentials =
        _authorizationCredentialsSerializer.fromMap(response);

    return authorizationCredentials;
  }
}
