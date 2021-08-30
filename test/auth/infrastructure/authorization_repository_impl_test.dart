import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';

void main() {
  late MockLocalAuthorizationProvider mockLocalAuthorizationProvider;
  late AuthorizationRepositoryImpl authorizationRepositoryImpl;

  setUp(() {
    mockLocalAuthorizationProvider = MockLocalAuthorizationProvider();
    authorizationRepositoryImpl = AuthorizationRepositoryImpl(
      mockLocalAuthorizationProvider,
    );
  });

  test('saves credentials successfully', () async {
    final credentials = AuthorizationCredentials(
      accessToken: 'token',
      refreshToken: 'refresh-token',
      accessTokenExpiration: DateTime(2020),
      refreshTokenExpiration: DateTime(2020),
    );

    when(() => mockLocalAuthorizationProvider.saveCredentials(credentials))
        .thenAnswer((_) async {});

    await authorizationRepositoryImpl.saveCredentials(credentials);

    verify(() => mockLocalAuthorizationProvider.saveCredentials(credentials))
        .called(1);
  });

  test(
    'returns Optional(AuthorizationCredentials) when credentials exist '
    'in the local provider',
    () async {
      final credentials = AuthorizationCredentials(
        accessToken: 'token',
        refreshToken: 'refresh-token',
        accessTokenExpiration: DateTime(2020),
        refreshTokenExpiration: DateTime(2020),
      );

      when(() => mockLocalAuthorizationProvider.getCredentials())
          .thenAnswer((_) async => Optional.of(credentials));

      final optional = await authorizationRepositoryImpl.getCredentials();

      expect(optional.isPresent, true);
      expect(optional.value, credentials);
    },
  );
}

class MockLocalAuthorizationProvider extends Mock
    implements LocalAuthorizationProvider {}
