import 'package:baratito_core/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';

void main() {
  late MockAuthorizationRepository mockAuthorizationRepository;
  late GetAuthorizationCredentialsUsecase getAuthorizationCredentialsUsecase;

  setUp(() {
    mockAuthorizationRepository = MockAuthorizationRepository();
    getAuthorizationCredentialsUsecase = GetAuthorizationCredentialsUsecase(
      mockAuthorizationRepository,
    );
  });

  final credentials = AuthorizationCredentials(
    accessToken: '',
    refreshToken: '',
    accessTokenExpiration: DateTime(2021),
    refreshTokenExpiration: DateTime(2022),
  );

  test(
    'returns Success(AuthorizationCredentials) on a successful call',
    () async {
      when(() => mockAuthorizationRepository.getCredentials())
          .thenAnswer((_) async => Success(credentials));

      final result = await getAuthorizationCredentialsUsecase();

      expect(result.isSuccess, true);
      expect(result.success, credentials);
    },
  );

  test(
    'returns Failue(NotFound) when no credentials exist',
    () async {
      when(() => mockAuthorizationRepository.getCredentials())
          .thenAnswer((_) async => Failure(NotFoundFailure()));

      final result = await getAuthorizationCredentialsUsecase();

      expect(result.isFailure, true);
      expect(result.failure, NotFoundFailure());
    },
  );
}

class MockAuthorizationRepository extends Mock
    implements AuthorizationRepository {}
