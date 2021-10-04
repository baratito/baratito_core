import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/social_auth/social_auth.dart';

const token = 'google-id-token';

void main() {
  late MockGoogleSignIn mockGoogleSignIn;
  late GoogleSignInService googleSignInService;

  setUp(() {
    mockGoogleSignIn = MockGoogleSignIn();
    googleSignInService = GoogleSignInService(mockGoogleSignIn);
  });

  final credentials = SocialAuthenticationCredentials(
    token: token,
    type: SocialAuthenticationType.google,
  );

  test(
    'returns SocialAuthenticationCredentials on a successful call',
    () async {
      when(() => mockGoogleSignIn.signIn()).thenAnswer((_) async {
        return FakeGoogleSignInAccount();
      });

      final result = await googleSignInService.signIn();

      verify(() => mockGoogleSignIn.signIn()).called(1);
      expect(result, credentials);
    },
  );
}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class FakeGoogleSignInAuthentication extends Fake
    with LegacyEquality
    implements GoogleSignInAuthentication {
  @override
  String? get idToken => token;
}

class FakeGoogleSignInAccount extends Fake
    with LegacyEquality
    implements GoogleSignInAccount {
  @override
  Future<GoogleSignInAuthentication> get authentication async {
    return FakeGoogleSignInAuthentication();
  }
}

mixin LegacyEquality {
  @override
  bool operator ==(dynamic other) => throw UnimplementedError();

  @override
  int get hashCode => throw UnimplementedError();
}
