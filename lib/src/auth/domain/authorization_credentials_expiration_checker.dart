import 'package:baratito_core/src/auth/domain/authorization_credentials.dart';
import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthorizationCredentialsExpirationChecker {
  final Clock _clock;

  AuthorizationCredentialsExpirationChecker(this._clock);

  bool accessTokenIsExpired(AuthorizationCredentials credentials) {
    final now = _clock.now();
    return now.isAfter(credentials.accessTokenExpiration);
  }

  bool refreshTokenIsExpired(AuthorizationCredentials credentials) {
    final now = _clock.now();
    return now.isAfter(credentials.refreshTokenExpiration);
  }
}
