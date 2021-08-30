import 'package:test/test.dart';

import 'package:baratito_core/src/social_auth/social_auth.dart';

void main() {
  late SocialAuthenticationCredentialsSerializer
      socialAuthenticationCredentialsSerializer;

  setUp(() {
    socialAuthenticationCredentialsSerializer =
        SocialAuthenticationCredentialsSerializer();
  });

  test(
    'toMap serializes credentials with type '
    'SocialAuthenticationType.google appropriately',
    () {
      final googleCredentials = SocialAuthenticationCredentials(
        token: 'social-token',
        type: SocialAuthenticationType.google,
      );

      final googleCredentialsMap = {
        'token': 'social-token',
        'type': 'google',
      };

      final result = socialAuthenticationCredentialsSerializer.toMap(
        googleCredentials,
      );
      expect(result, googleCredentialsMap);
    },
  );

  test(
    'toMap serializes credentials with type '
    'SocialAuthenticationType.facebook appropriately',
    () {
      final facebookCredentials = SocialAuthenticationCredentials(
        token: 'social-token',
        type: SocialAuthenticationType.facebook,
      );

      final facebookCredentialsMap = {
        'token': 'social-token',
        'type': 'facebook',
      };

      final result = socialAuthenticationCredentialsSerializer.toMap(
        facebookCredentials,
      );
      expect(result, facebookCredentialsMap);
    },
  );
}
