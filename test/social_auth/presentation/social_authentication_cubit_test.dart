import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/social_auth/social_auth.dart';

void main() {
  late MockSocialAuthenticateUsecase mockSocialAuthenticateUsecase;
  late SocialAuthenticationCubit socialAuthenticationCubit;

  setUp(() {
    mockSocialAuthenticateUsecase = MockSocialAuthenticateUsecase();
    socialAuthenticationCubit = SocialAuthenticationCubit(
      mockSocialAuthenticateUsecase,
    );
  });

  group('on authenticate(SocialAuthenticationCredentials)', () {
    final authenticationCredentials = SocialAuthenticationCredentials(
      token: '',
      type: SocialAuthenticationType.google,
    );
    final authorizationCredentials = AuthorizationCredentials(
      accessToken: '',
      refreshToken: '',
      accessTokenExpiration: DateTime(2021),
      refreshTokenExpiration: DateTime(2022),
    );

    blocTest<SocialAuthenticationCubit, SocialAuthenticationState>(
      'emits [SocialAuthenticationSuccessful] on a successful usecase call',
      build: () => socialAuthenticationCubit,
      act: (cubit) {
        when(() {
          return mockSocialAuthenticateUsecase(
            credentials: authenticationCredentials,
          );
        }).thenAnswer((_) async => Success(authorizationCredentials));

        cubit.authenticate(authenticationCredentials);
      },
      expect: () => const [SocialAuthenticationSuccessful()],
    );

    blocTest<SocialAuthenticationCubit, SocialAuthenticationState>(
      'emits [SocialAuthenticationFailed(ServerFailure)] on a usecase call '
      'that failed with ServerFailure()',
      build: () => socialAuthenticationCubit,
      act: (cubit) {
        when(() {
          return mockSocialAuthenticateUsecase(
            credentials: authenticationCredentials,
          );
        }).thenAnswer((_) async => Failure(ServerFailure()));

        cubit.authenticate(authenticationCredentials);
      },
      expect: () => const [SocialAuthenticationFailed(ServerFailure())],
    );

    blocTest<SocialAuthenticationCubit, SocialAuthenticationState>(
      'emits [SocialAuthenticationFailed(ConnectionFailure)] on a usecase call '
      'that failed with ConnectionFailure()',
      build: () => socialAuthenticationCubit,
      act: (cubit) {
        when(() {
          return mockSocialAuthenticateUsecase(
            credentials: authenticationCredentials,
          );
        }).thenAnswer((_) async => Failure(ConnectionFailure()));

        cubit.authenticate(authenticationCredentials);
      },
      expect: () => const [SocialAuthenticationFailed(ConnectionFailure())],
    );
  });
}

class MockSocialAuthenticateUsecase extends Mock
    implements SocialAuthenticateUsecase {}
