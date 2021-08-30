import 'package:baratito_core/src/auth/auth.dart';

class SocialAuthenticationCredentials extends AuthenticationCredentials {
  final String token;
  final SocialAuthenticationType type;

  SocialAuthenticationCredentials({required this.token, required this.type});

  @override
  List<Object?> get props => [...super.props, token, type];
}

enum SocialAuthenticationType {
  google,
  facebook,
}
