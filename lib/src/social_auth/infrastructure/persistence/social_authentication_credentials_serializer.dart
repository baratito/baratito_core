import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/social_auth/domain/domain.dart';

typedef AuthenticationCredentialsSerializerAlias
    = AuthenticationCredentialsSerializer<SocialAuthenticationCredentials>;

@Singleton(as: AuthenticationCredentialsSerializerAlias)
class SocialAuthenticationCredentialsSerializer
    implements
        AuthenticationCredentialsSerializer<SocialAuthenticationCredentials> {
  @override
  Map<String, dynamic> toMap(SocialAuthenticationCredentials credentials) {
    return {
      'token': credentials.token,
      'type': _typeToString(credentials.type),
    };
  }

  String _typeToString(SocialAuthenticationType type) {
    return type.toString().split('.').last;
  }
}
