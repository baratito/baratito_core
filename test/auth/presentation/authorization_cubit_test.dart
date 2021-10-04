import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockGetAuthorizationCredentialsUsecase
      mockGetAuthorizationCredentialsUsecase;
  late MockSignOutUsecase mockSignOutUsecase;
  late AuthorizationCubit authorizationCubit;

  setUp(() {
    mockGetAuthorizationCredentialsUsecase =
        MockGetAuthorizationCredentialsUsecase();
    mockSignOutUsecase = MockSignOutUsecase();
    authorizationCubit = AuthorizationCubit(
      mockGetAuthorizationCredentialsUsecase,
      mockSignOutUsecase,
    );
  });

  group('on checkAuthorizationStatus()', () {
    final credentials = AuthorizationCredentials(
      accessToken: '',
      refreshToken: '',
      accessTokenExpiration: DateTime(2021),
      refreshTokenExpiration: DateTime(2022),
    );

    blocTest<AuthorizationCubit, AuthorizationState>(
      'emits [AuthorizationSuccessful] on a successful usecase call',
      build: () => authorizationCubit,
      act: (cubit) {
        when(() {
          return mockGetAuthorizationCredentialsUsecase();
        }).thenAnswer((_) async => Success(credentials));
        cubit.checkAuthorizationStatus();
      },
      expect: () => const [AuthorizationSuccessful()],
    );

    blocTest<AuthorizationCubit, AuthorizationState>(
      'emits [AuthorizationFailed] on a failed usecase call',
      build: () => authorizationCubit,
      act: (cubit) {
        when(() {
          return mockGetAuthorizationCredentialsUsecase();
        }).thenAnswer((_) async => Failure(NotFoundFailure()));
        cubit.checkAuthorizationStatus();
      },
      expect: () => const [AuthorizationFailed()],
    );
  });

  group('on signOut()', () {
    blocTest<AuthorizationCubit, AuthorizationState>(
      'emits [SignOutSuccessful] on a successful usecase call',
      build: () => authorizationCubit,
      act: (cubit) {
        when(() => mockSignOutUsecase()).thenAnswer((_) async {});
        cubit.signOut();
      },
      expect: () => const [SignOutSuccessful()],
    );
  });
}

class MockGetAuthorizationCredentialsUsecase extends Mock
    implements GetAuthorizationCredentialsUsecase {}

class MockSignOutUsecase extends Mock implements SignOutUsecase {}
