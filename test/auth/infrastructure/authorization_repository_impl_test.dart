import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockLocalAuthorizationProvider mockLocalAuthorizationProvider;
  late AuthorizationRepositoryImpl authorizationRepositoryImpl;

  setUp(() {
    mockLocalAuthorizationProvider = MockLocalAuthorizationProvider();
    authorizationRepositoryImpl = AuthorizationRepositoryImpl(
      mockLocalAuthorizationProvider,
    );
  });

  test('makes provider call to save credentials successfully', () async {
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
    'returns Success(AuthorizationCredentials) when credentials exist '
    'in local provider',
    () async {
      final credentials = AuthorizationCredentials(
        accessToken: 'token',
        refreshToken: 'refresh-token',
        accessTokenExpiration: DateTime(2020),
        refreshTokenExpiration: DateTime(2020),
      );

      when(() => mockLocalAuthorizationProvider.getCredentials())
          .thenAnswer((_) async => Optional.of(credentials));

      final result = await authorizationRepositoryImpl.getCredentials();

      expect(result.isSuccess, true);
      expect(result.success, credentials);
    },
  );

  test(
    'returns Failure(NotFoundFailure) when no credentials exist '
    'in local provider',
    () async {
      when(() => mockLocalAuthorizationProvider.getCredentials())
          .thenAnswer((_) async => Optional.empty());

      final result = await authorizationRepositoryImpl.getCredentials();

      expect(result.isFailure, true);
      expect(result.failure, NotFoundFailure());
    },
  );

  test('makes provider call to remove credentials successfully', () async {
    when(() => mockLocalAuthorizationProvider.removeCredentials())
        .thenAnswer((_) async {});

    await authorizationRepositoryImpl.removeCredentials();

    verify(() => mockLocalAuthorizationProvider.removeCredentials()).called(1);
  });
}

class MockLocalAuthorizationProvider extends Mock
    implements LocalAuthorizationProvider {}
