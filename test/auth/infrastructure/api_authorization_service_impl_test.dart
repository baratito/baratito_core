import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';

void main() {
  late MockLocalAuthorizationProvider mockLocalAuthorizationProvider;
  late MockAuthorizationCredentialsExpirationChecker
      mockAuthorizationCredentialsExpirationChecker;
  late MockRemoteAuthorizationRefresher mockRemoteAuthorizationRefresher;
  late ApiAuthorizationServiceImpl apiAuthorizationServiceImpl;

  setUp(() {
    mockLocalAuthorizationProvider = MockLocalAuthorizationProvider();
    mockAuthorizationCredentialsExpirationChecker =
        MockAuthorizationCredentialsExpirationChecker();
    mockRemoteAuthorizationRefresher = MockRemoteAuthorizationRefresher();
    apiAuthorizationServiceImpl = ApiAuthorizationServiceImpl(
      mockLocalAuthorizationProvider,
      mockAuthorizationCredentialsExpirationChecker,
      mockRemoteAuthorizationRefresher,
    );
  });

  final validToken = 'valid-token';
  final expiredToken = 'expired-token';

  final validCredentials = AuthorizationCredentials(
    accessToken: validToken,
    refreshToken: '',
    accessTokenExpiration: DateTime(2022),
    refreshTokenExpiration: DateTime(2022),
  );

  final expiredCredentials = AuthorizationCredentials(
    accessToken: expiredToken,
    refreshToken: '',
    accessTokenExpiration: DateTime(2019),
    refreshTokenExpiration: DateTime(2019),
  );

  test(
    'returns token without refreshing when valid credentials exist locally',
    () async {
      when(() => mockLocalAuthorizationProvider.getCredentials())
          .thenAnswer((_) async => Optional.of(validCredentials));

      when(() {
        return mockAuthorizationCredentialsExpirationChecker
            .accessTokenIsExpired(validCredentials);
      }).thenAnswer((_) => false);

      final result = await apiAuthorizationServiceImpl.getToken();

      verify(() => mockLocalAuthorizationProvider.getCredentials()).called(1);
      verify(() {
        return mockAuthorizationCredentialsExpirationChecker
            .accessTokenIsExpired(validCredentials);
      }).called(1);
      verifyNever(
        () => mockRemoteAuthorizationRefresher.refresh(validCredentials),
      );

      expect(result, validToken);
    },
  );

  test(
    'returns token and refreshes credentials when expired credentials '
    'exist locally',
    () async {
      when(() => mockLocalAuthorizationProvider.getCredentials())
          .thenAnswer((_) async => Optional.of(expiredCredentials));

      when(() {
        return mockAuthorizationCredentialsExpirationChecker
            .accessTokenIsExpired(expiredCredentials);
      }).thenAnswer((_) => true);

      when(() {
        return mockRemoteAuthorizationRefresher.refresh(expiredCredentials);
      }).thenAnswer((_) async => validCredentials);

      when(() {
        return mockLocalAuthorizationProvider.saveCredentials(validCredentials);
      }).thenAnswer((_) async {});

      final result = await apiAuthorizationServiceImpl.getToken();

      verify(() => mockLocalAuthorizationProvider.getCredentials()).called(1);
      verify(() {
        return mockAuthorizationCredentialsExpirationChecker
            .accessTokenIsExpired(expiredCredentials);
      }).called(1);
      verify(
        () => mockRemoteAuthorizationRefresher.refresh(expiredCredentials),
      ).called(1);

      expect(result, validToken);
    },
  );
}

class MockLocalAuthorizationProvider extends Mock
    implements LocalAuthorizationProvider {}

class MockAuthorizationCredentialsExpirationChecker extends Mock
    implements AuthorizationCredentialsExpirationChecker {}

class MockRemoteAuthorizationRefresher extends Mock
    implements RemoteAuthorizationRefresher {}
