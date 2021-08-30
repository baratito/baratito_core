import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/social_auth/social_auth.dart';
import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockRemoteSocialAuthenticationProvider
      mockRemoteSocialAuthenticationProvider;
  late SocialAuthenticationRepository authenticationRepositoryImpl;

  setUp(() {
    mockRemoteSocialAuthenticationProvider =
        MockRemoteSocialAuthenticationProvider();
    authenticationRepositoryImpl = SocialAuthenticationRepository(
      mockRemoteSocialAuthenticationProvider,
    );
  });

  final authenticationCredentials = SocialAuthenticationCredentials(
    token: 'social-token',
    type: SocialAuthenticationType.google,
  );

  test(
    'returns Success(AuthorizationCredentials) on a successful call',
    () async {
      final expectedAuthorizationCredentials = AuthorizationCredentials(
        accessToken: 'token',
        refreshToken: 'refresh-token',
        accessTokenExpiration: DateTime(2020),
        refreshTokenExpiration: DateTime(2020),
      );

      when(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).thenAnswer((_) async => expectedAuthorizationCredentials);

      final result = await authenticationRepositoryImpl.authenticate(
        authenticationCredentials,
      );

      verify(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).called(1);

      expect(result.isSuccess, true);
      expect(result.success, expectedAuthorizationCredentials);
    },
  );

  test(
    'returns Failure(ServerFailure) when the provider call '
    'throws ServerException',
    () async {
      when(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).thenThrow(ServerException());

      final result = await authenticationRepositoryImpl.authenticate(
        authenticationCredentials,
      );

      verify(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).called(1);

      expect(result.isFailure, true);
      expect(result.failure, ServerFailure());
    },
  );

  test(
    'returns Failure(ConnectionFailure) when the provider call '
    'throws ConnectionException',
    () async {
      when(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).thenThrow(ConnectionException());

      final result = await authenticationRepositoryImpl.authenticate(
        authenticationCredentials,
      );

      verify(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).called(1);

      expect(result.isFailure, true);
      expect(result.failure, ConnectionFailure());
    },
  );

  test(
    'throws an Exception when the provider call throws an '
    'unhandled Exception type',
    () async {
      when(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).thenThrow(FakeException());

      expect(
        () async {
          return await authenticationRepositoryImpl.authenticate(
            authenticationCredentials,
          );
        },
        throwsA(isA<Exception>()),
      );

      verify(
        () {
          return mockRemoteSocialAuthenticationProvider.authenticate(
            authenticationCredentials,
          );
        },
      ).called(1);
    },
  );
}

class MockRemoteSocialAuthenticationProvider extends Mock
    implements RemoteSocialAuthenticationProvider {}

class FakeException extends Fake implements Exception {}
