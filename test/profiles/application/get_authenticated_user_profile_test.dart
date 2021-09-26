import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/profiles/profiles.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockProfilesRepository mockProfilesRepository;
  late GetAuthenticatedUserProfileUsecase getAuthenticatedUserProfileUsecase;

  setUp(() {
    mockProfilesRepository = MockProfilesRepository();
    getAuthenticatedUserProfileUsecase = GetAuthenticatedUserProfileUsecase(
      mockProfilesRepository,
    );
  });

  const profileModel = ProfileModel(
    id: 1,
    firstName: 'name',
    lastName: 'last_name',
    email: 'email',
    avatarUrl: 'avatar',
  );

  const profile = Profile(
    id: 1,
    firstName: 'name',
    lastName: 'last_name',
    email: 'email',
    avatarUrl: 'avatar',
  );

  test('returns Success(Profile) on a successful call', () async {
    when(() => mockProfilesRepository.getAuthenticatedUserProfile())
        .thenAnswer((_) async => Success(profileModel));

    final result = await getAuthenticatedUserProfileUsecase();

    verify(() => mockProfilesRepository.getAuthenticatedUserProfile())
        .called(1);

    expect(result.isSuccess, true);
    expect(result.success, profile);
  });

  test(
    'returns Failue(NotFoundFailure) when the repository '
    'fails with NotFoundFailure',
    () async {
      when(() => mockProfilesRepository.getAuthenticatedUserProfile())
          .thenAnswer((_) async => Failure(NotFoundFailure()));

      final result = await getAuthenticatedUserProfileUsecase();

      expect(result.isFailure, true);
      expect(result.failure, NotFoundFailure());
    },
  );

  test(
    'returns Failue(ServerFailure) when the repository '
    'fails with ServerFailure',
    () async {
      when(() => mockProfilesRepository.getAuthenticatedUserProfile())
          .thenAnswer((_) async => Failure(ServerFailure()));

      final result = await getAuthenticatedUserProfileUsecase();

      expect(result.isFailure, true);
      expect(result.failure, ServerFailure());
    },
  );

  test(
    'returns Failue(ConnectionFailure) when the repository '
    'fails with ConnectionFailure',
    () async {
      when(() => mockProfilesRepository.getAuthenticatedUserProfile())
          .thenAnswer((_) async => Failure(ConnectionFailure()));

      final result = await getAuthenticatedUserProfileUsecase();

      expect(result.isFailure, true);
      expect(result.failure, ConnectionFailure());
    },
  );
}

class MockProfilesRepository extends Mock implements ProfilesRepository {}
