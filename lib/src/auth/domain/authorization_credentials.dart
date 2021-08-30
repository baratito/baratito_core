import 'package:equatable/equatable.dart';

class AuthorizationCredentials extends Equatable {
  /// The token that is sent to the server to prove the authorization
  /// of a client.
  final String accessToken;

  /// The token that is sent to the server to refresh the credentials.
  final String refreshToken;

  /// The date at which these access credentials will expire,
  /// stored in the user's local time.
  ///
  /// This is likely to be a few seconds earlier than the server's idea of the
  /// expiration date.
  final DateTime accessTokenExpiration;

  /// The date at which these refresh credentials will expire,
  /// stored in the user's local time.
  ///
  /// This is likely to be a few seconds earlier than the server's idea of the
  /// expiration date.
  final DateTime refreshTokenExpiration;

  AuthorizationCredentials({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiration,
    required this.refreshTokenExpiration,
  });

  bool get accessTokenIsExpired {
    return DateTime.now().isAfter(accessTokenExpiration);
  }

  bool get refreshTokenIsExpired {
    return DateTime.now().isAfter(refreshTokenExpiration);
  }

  @override
  List<Object?> get props {
    return [
      accessToken,
      refreshToken,
      accessTokenExpiration,
      refreshTokenExpiration,
    ];
  }
}
