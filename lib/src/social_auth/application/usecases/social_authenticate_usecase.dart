import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/social_auth/domain/domain.dart';

@lazySingleton
class SocialAuthenticateUsecase
    extends AuthenticateUsecase<SocialAuthenticationCredentials> {
  SocialAuthenticateUsecase(
    AuthenticationRepository<SocialAuthenticationCredentials>
        authenticationRepository,
    AuthorizationRepository authorizationRepository,
  ) : super(authenticationRepository, authorizationRepository);
}
