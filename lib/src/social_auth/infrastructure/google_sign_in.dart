import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoogleSignInModule {
  final _instance = GoogleSignIn(
    scopes: [
      'openid',
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );
  GoogleSignIn get signIn => _instance;
}
