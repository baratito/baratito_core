import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/social_auth/domain/domain.dart';

abstract class RemoteSocialAuthenticationProvider {
  Future<AuthorizationCredentials> authenticate(
    SocialAuthenticationCredentials credentials,
  );
}
