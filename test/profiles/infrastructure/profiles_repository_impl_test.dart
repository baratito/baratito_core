import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/profiles/profiles.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockRemoteProfilesProvider mockRemoteProfilesProvider;
  late ProfilesRepositoryImpl profilesRepositoryImpl;

  setUp(() {
    mockRemoteProfilesProvider = MockRemoteProfilesProvider();
    profilesRepositoryImpl = ProfilesRepositoryImpl(
      mockRemoteProfilesProvider,
    );
  });

  group('on getAuthenticatedUserProfile', () {
    test(
      'returns Success(ProfileModel) on a successful call to remote provider',
      () async {
        const profileModel = ProfileModel(
          id: 1,
          firstName: 'name',
          lastName: 'last_name',
          email: 'email',
          avatarUrl: 'avatar',
        );

        when(() => mockRemoteProfilesProvider.getAuthenticatedUserProfile())
            .thenAnswer((_) async => profileModel);

        final result =
            await profilesRepositoryImpl.getAuthenticatedUserProfile();

        expect(result.isSuccess, true);
        expect(result.success, profileModel);
      },
    );

    test(
      'returns Failure(NotFoundFailure) when remote provider fails with '
      'NotFoundException',
      () async {
        when(() => mockRemoteProfilesProvider.getAuthenticatedUserProfile())
            .thenThrow(NotFoundException());

        final result =
            await profilesRepositoryImpl.getAuthenticatedUserProfile();

        expect(result.isFailure, true);
        expect(result.failure, NotFoundFailure());
      },
    );

    test(
      'returns Failure(ServerFailure) when remote provider fails with '
      'ServerException',
      () async {
        when(() => mockRemoteProfilesProvider.getAuthenticatedUserProfile())
            .thenThrow(ServerException());

        final result =
            await profilesRepositoryImpl.getAuthenticatedUserProfile();

        expect(result.isFailure, true);
        expect(result.failure, ServerFailure());
      },
    );

    test(
      'returns Failure(ConnectionFailure) when remote provider fails with '
      'ConnectionException',
      () async {
        when(() => mockRemoteProfilesProvider.getAuthenticatedUserProfile())
            .thenThrow(ConnectionException());

        final result =
            await profilesRepositoryImpl.getAuthenticatedUserProfile();

        expect(result.isFailure, true);
        expect(result.failure, ConnectionFailure());
      },
    );

    test(
      'throws an Exception when the provider call throws an '
      'unhandled Exception type',
      () async {
        when(() => mockRemoteProfilesProvider.getAuthenticatedUserProfile())
            .thenThrow(FakeException());

        expect(
          () async {
            return await profilesRepositoryImpl.getAuthenticatedUserProfile();
          },
          throwsA(isA<Exception>()),
        );

        verify(() => mockRemoteProfilesProvider.getAuthenticatedUserProfile())
            .called(1);
      },
    );
  });
}

class MockRemoteProfilesProvider extends Mock
    implements RemoteProfilesProvider {}

class FakeException extends Fake implements Exception {}
