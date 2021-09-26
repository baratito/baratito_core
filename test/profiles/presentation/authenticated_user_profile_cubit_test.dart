import 'package:baratito_core/baratito_core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/profiles/profiles.dart';

void main() {
  late MockGetAuthenticatedUserProfileUsecase
      mockGetAuthenticatedUserProfileUsecase;
  late AuthenticatedUserProfileCubit authenticatedUserProfileCubit;

  setUp(() {
    mockGetAuthenticatedUserProfileUsecase =
        MockGetAuthenticatedUserProfileUsecase();
    authenticatedUserProfileCubit = AuthenticatedUserProfileCubit(
      mockGetAuthenticatedUserProfileUsecase,
    );
  });

  const profile = Profile(
    id: 1,
    firstName: 'name',
    lastName: 'last_name',
    email: 'email',
    avatarUrl: 'avatar',
  );

  group('on get', () {
    blocTest<AuthenticatedUserProfileCubit, AuthenticatedUserProfileState>(
      'emits [AuthenticatedUserProfileGetSuccessful] '
      'on a successful usecase call',
      build: () => authenticatedUserProfileCubit,
      act: (cubit) {
        when(() => mockGetAuthenticatedUserProfileUsecase())
            .thenAnswer((_) async => Success(profile));

        cubit.get();
      },
      verify: (_) {
        verify(() => mockGetAuthenticatedUserProfileUsecase()).called(1);
      },
      expect: () => [AuthenticatedUserProfileGetSuccessful(profile)],
    );

    blocTest<AuthenticatedUserProfileCubit, AuthenticatedUserProfileState>(
      'emits [AuthenticatedUserProfileGetFailed(ServerFailure)] on a '
      'usecase call that failed with ServerFailure',
      build: () => authenticatedUserProfileCubit,
      act: (cubit) {
        when(() => mockGetAuthenticatedUserProfileUsecase())
            .thenAnswer((_) async => Failure(ServerFailure()));

        cubit.get();
      },
      verify: (_) {
        verify(() => mockGetAuthenticatedUserProfileUsecase()).called(1);
      },
      expect: () => [AuthenticatedUserProfileGetFailed(ServerFailure())],
    );

    blocTest<AuthenticatedUserProfileCubit, AuthenticatedUserProfileState>(
      'emits [AuthenticatedUserProfileGetFailed(ConnectionFailure)] on a '
      'usecase call that failed with ConnectionFailure',
      build: () => authenticatedUserProfileCubit,
      act: (cubit) {
        when(() => mockGetAuthenticatedUserProfileUsecase())
            .thenAnswer((_) async => Failure(ConnectionFailure()));

        cubit.get();
      },
      verify: (_) {
        verify(() => mockGetAuthenticatedUserProfileUsecase()).called(1);
      },
      expect: () => [AuthenticatedUserProfileGetFailed(ConnectionFailure())],
    );

    blocTest<AuthenticatedUserProfileCubit, AuthenticatedUserProfileState>(
      'emits [AuthenticatedUserProfileGetFailed(NotFoundFailure)] on a '
      'usecase call that failed with NotFoundFailure',
      build: () => authenticatedUserProfileCubit,
      act: (cubit) {
        when(() => mockGetAuthenticatedUserProfileUsecase())
            .thenAnswer((_) async => Failure(NotFoundFailure()));

        cubit.get();
      },
      verify: (_) {
        verify(() => mockGetAuthenticatedUserProfileUsecase()).called(1);
      },
      expect: () => [AuthenticatedUserProfileGetFailed(NotFoundFailure())],
    );
  });
}

class MockGetAuthenticatedUserProfileUsecase extends Mock
    implements GetAuthenticatedUserProfileUsecase {}
