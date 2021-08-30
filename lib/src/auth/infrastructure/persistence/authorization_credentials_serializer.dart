import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';

@singleton
class AuthorizationCredentialsSerializer {
  AuthorizationCredentials fromMap(Map<String, dynamic> map) {
    return AuthorizationCredentials(
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
      accessTokenExpiration: DateTime.tryParse(map['expiration_access_token'])!,
      refreshTokenExpiration:
          DateTime.tryParse(map['expiration_refresh_token'])!,
    );
  }

  Map<String, dynamic> toMap(AuthorizationCredentials credentials) {
    return {
      'access_token': credentials.accessToken,
      'refresh_token': credentials.refreshToken,
      'expiration_access_token':
          credentials.accessTokenExpiration.toIso8601String(),
      'expiration_refresh_token':
          credentials.refreshTokenExpiration.toIso8601String(),
    };
  }
}
