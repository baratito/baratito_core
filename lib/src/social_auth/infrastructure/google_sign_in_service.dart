import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/social_auth/domain/domain.dart';

@lazySingleton
class GoogleSignInService {
  final GoogleSignIn _googleSignIn;

  GoogleSignInService(this._googleSignIn);

  Future<SocialAuthenticationCredentials> signIn() async {
    final auth = await _googleSignIn.signIn();

    final authUser = await auth?.authentication;
    final socialAuthenticationToken = authUser?.idToken ?? '';

    final credentials = SocialAuthenticationCredentials(
      token: socialAuthenticationToken,
      type: SocialAuthenticationType.google,
    );

    return credentials;
  }
}
