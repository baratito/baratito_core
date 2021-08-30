import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockApiClient mockApiClient;
  late MockAuthorizationCredentialsSerializer
      mockAuthorizationCredentialsSerializer;
  late ApiAuthorizationRefresher apiAuthorizationRefresher;

  setUp(() {
    mockApiClient = MockApiClient();
    mockAuthorizationCredentialsSerializer =
        MockAuthorizationCredentialsSerializer();
    apiAuthorizationRefresher = ApiAuthorizationRefresher(
      mockApiClient,
      mockAuthorizationCredentialsSerializer,
    );
  });

  final endpoint = 'https://api.baratito.app/api/refresh_token/';
  final uri = Uri.dataFromString(endpoint);

  final expiredAccessToken = 'expired-token';
  final expiredCredentialsRefreshToken = 'expired-credentials-refresh-token';
  final validAccessToken = 'valid-token';
  final validCredentialsRefreshToken = 'valid-credentials-refresh-token';

  final expiredCredentials = AuthorizationCredentials(
    accessToken: expiredAccessToken,
    refreshToken: expiredCredentialsRefreshToken,
    accessTokenExpiration: DateTime(2020),
    refreshTokenExpiration: DateTime(2022),
  );

  final expiredCredentialsMap = {
    'access_token': validAccessToken,
    'refresh_token': expiredCredentialsRefreshToken,
    'expiration_access_token': '2020-01-01T00:00:00.000',
    'expiration_refresh_token': '2022-01-01T00:00:00.000',
  };

  final validCredentials = AuthorizationCredentials(
    accessToken: validAccessToken,
    refreshToken: validCredentialsRefreshToken,
    accessTokenExpiration: DateTime(2021),
    refreshTokenExpiration: DateTime(2023),
  );

  final validCredentialsMap = {
    'access_token': validAccessToken,
    'refresh_token': validCredentialsRefreshToken,
    'expiration_access_token': '2021-01-01T00:00:00.000',
    'expiration_refresh_token': '2023-01-01T00:00:00.000',
  };

  test('refreshes credentials successfully', () async {
    when(() => mockAuthorizationCredentialsSerializer.toMap(expiredCredentials))
        .thenAnswer((_) => expiredCredentialsMap);

    when(() => mockApiClient.post(uri, body: expiredCredentialsMap))
        .thenAnswer((_) async => validCredentialsMap);

    when(() {
      return mockAuthorizationCredentialsSerializer
          .fromMap(validCredentialsMap);
    }).thenAnswer((_) => validCredentials);

    final result = await apiAuthorizationRefresher.refresh(expiredCredentials);

    expect(result, validCredentials);
  });
}

class MockApiClient extends Mock implements ApiClient {}

class MockAuthorizationCredentialsSerializer extends Mock
    implements AuthorizationCredentialsSerializer {}
