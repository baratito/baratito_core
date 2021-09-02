import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/social_auth/social_auth.dart';

void main() {
  late MockApiClient mockApiClient;
  late MockSocialAuthenticationCredentialsSerializer
      mockSocialAuthenticationCredentialsSerializer;
  late MockAuthorizationCredentialsSerializer
      mockAuthorizationCredentialsSerializer;
  late ApiSocialAuthenticationProvider apiSocialAuthenticationProvider;

  setUp(() {
    mockApiClient = MockApiClient();
    mockSocialAuthenticationCredentialsSerializer =
        MockSocialAuthenticationCredentialsSerializer();
    mockAuthorizationCredentialsSerializer =
        MockAuthorizationCredentialsSerializer();
    apiSocialAuthenticationProvider = ApiSocialAuthenticationProvider(
      mockApiClient,
      mockSocialAuthenticationCredentialsSerializer,
      mockAuthorizationCredentialsSerializer,
    );
  });

  final headers = {'Content-Type': 'application/json'};
  final endpoint = 'https://api.baratito.app/api/login/';
  final uri = Uri.parse(endpoint);

  final authenticationCredentials = SocialAuthenticationCredentials(
    token: 'social-token',
    type: SocialAuthenticationType.google,
  );
  final authenticationCredentialsMap = {
    'token': authenticationCredentials.token,
    'type': 'google',
  };

  test('returns ApiTokenAuthorizationCredentials on a successful call',
      () async {
    final expectedCredentialsMap = {
      'access_token': 'token',
      'refresh_token': 'refresh-token',
      'expiration_access_token': '2020-01-01T00:00:00.000',
      'expiration_refresh_token': '2020-01-01T00:00:00.000',
    };
    final expectedCredentials = AuthorizationCredentials(
      accessToken: 'token',
      refreshToken: 'refresh-token',
      accessTokenExpiration: DateTime(2020),
      refreshTokenExpiration: DateTime(2020),
    );

    when(
      () {
        return mockSocialAuthenticationCredentialsSerializer.toMap(
          authenticationCredentials,
        );
      },
    ).thenAnswer((_) => authenticationCredentialsMap);

    when(
      () {
        return mockApiClient.post(
          uri,
          body: authenticationCredentialsMap,
          headers: headers,
        );
      },
    ).thenAnswer((_) async => expectedCredentialsMap);

    when(
      () {
        return mockAuthorizationCredentialsSerializer.fromMap(
          expectedCredentialsMap,
        );
      },
    ).thenAnswer((_) => expectedCredentials);

    final authorizationCredentials = await apiSocialAuthenticationProvider
        .authenticate(authenticationCredentials);

    verify(
      () {
        return mockSocialAuthenticationCredentialsSerializer.toMap(
          authenticationCredentials,
        );
      },
    ).called(1);

    verify(
      () {
        return mockApiClient.post(
          uri,
          body: authenticationCredentialsMap,
          headers: headers,
        );
      },
    ).called(1);

    verify(
      () {
        return mockAuthorizationCredentialsSerializer.fromMap(
          expectedCredentialsMap,
        );
      },
    ).called(1);

    expect(authorizationCredentials, expectedCredentials);
  });
}

class MockApiClient extends Mock implements ApiClient {}

class MockSocialAuthenticationCredentialsSerializer extends Mock
    implements
        AuthenticationCredentialsSerializer<SocialAuthenticationCredentials> {}

class MockAuthorizationCredentialsSerializer extends Mock
    implements AuthorizationCredentialsSerializer {}
