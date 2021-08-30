import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';

void main() {
  late AuthorizationCredentialsSerializer authorizationCredentialsSerializer;
  setUp(() {
    authorizationCredentialsSerializer = AuthorizationCredentialsSerializer();
  });

  final credentials = AuthorizationCredentials(
    accessToken: 'token',
    refreshToken: 'refresh-token',
    accessTokenExpiration: DateTime(2020),
    refreshTokenExpiration: DateTime(2020),
  );

  final credentialsMap = {
    'access_token': 'token',
    'refresh_token': 'refresh-token',
    'expiration_access_token': '2020-01-01T00:00:00.000',
    'expiration_refresh_token': '2020-01-01T00:00:00.000',
  };

  test('toMap serializes appropriately', () {
    final result = authorizationCredentialsSerializer.toMap(credentials);

    expect(result, credentialsMap);
  });

  test('fromMap serializes appropriately', () {
    final result = authorizationCredentialsSerializer.fromMap(credentialsMap);

    expect(result, credentials);
  });
}
