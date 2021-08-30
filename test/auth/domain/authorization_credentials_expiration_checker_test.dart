import 'package:clock/clock.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';

void main() {
  late Clock clock;
  late AuthorizationCredentialsExpirationChecker
      authorizationCredentialsExpirationChecker;

  setUp(() {
    clock = Clock.fixed(DateTime(2020));
    authorizationCredentialsExpirationChecker =
        AuthorizationCredentialsExpirationChecker(clock);
  });

  final validCredentials = AuthorizationCredentials(
    accessToken: '',
    refreshToken: '',
    accessTokenExpiration: DateTime(2021),
    refreshTokenExpiration: DateTime(2021),
  );

  final expiredCredentials = AuthorizationCredentials(
    accessToken: '',
    refreshToken: '',
    accessTokenExpiration: DateTime(2019),
    refreshTokenExpiration: DateTime(2019),
  );

  group('on accessTokenIsExpired()', () {
    test('return false on valid credentials', () {
      final result = authorizationCredentialsExpirationChecker
          .accessTokenIsExpired(validCredentials);

      expect(result, false);
    });

    test('return true on expired credentials', () {
      final result = authorizationCredentialsExpirationChecker
          .accessTokenIsExpired(expiredCredentials);

      expect(result, true);
    });
  });

  group('on refreshTokenIsExpired()', () {
    test('return false on valid credentials', () {
      final result = authorizationCredentialsExpirationChecker
          .accessTokenIsExpired(validCredentials);

      expect(result, false);
    });

    test('return true on expired credentials', () {
      final result = authorizationCredentialsExpirationChecker
          .accessTokenIsExpired(expiredCredentials);

      expect(result, true);
    });
  });
}
