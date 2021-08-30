import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockAuthenticationRepository mockAuthenticationRepository;
  late MockAuthorizationRepository mockAuthorizationRepository;
  late AuthenticateUsecase<FakeAuthenticationCredentials> authenticateUsecase;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    mockAuthorizationRepository = MockAuthorizationRepository();
    authenticateUsecase = AuthenticateUsecase(
      mockAuthenticationRepository,
      mockAuthorizationRepository,
    );
  });

  setUpAll(() {
    registerFallbackValue(FakeAuthorizationCredentials());
  });

  final authenticationCredentials = FakeAuthenticationCredentials();

  test(
    'returns Success(AuthorizationCredentials) on a successful call',
    () async {
      final expectedAuthorizationCredentials = FakeAuthorizationCredentials();

      when(() {
        return mockAuthenticationRepository.authenticate(
          authenticationCredentials,
        );
      }).thenAnswer((_) async => Success(expectedAuthorizationCredentials));

      when(() {
        return mockAuthorizationRepository.saveCredentials(
          expectedAuthorizationCredentials,
        );
      }).thenAnswer((_) async {});

      final result = await authenticateUsecase(
        credentials: authenticationCredentials,
      );

      verify(() {
        return mockAuthenticationRepository.authenticate(
          authenticationCredentials,
        );
      }).called(1);

      verify(() {
        return mockAuthorizationRepository.saveCredentials(
          expectedAuthorizationCredentials,
        );
      }).called(1);

      expect(result.isSuccess, true);
      expect(result.success, expectedAuthorizationCredentials);
    },
  );

  test(
    'returns Failure(ServerFailure) on an authentication call '
    'that failed with ServerFailure',
    () async {
      when(() {
        return mockAuthenticationRepository.authenticate(
          authenticationCredentials,
        );
      }).thenAnswer((_) async => Failure(ServerFailure()));

      final result = await authenticateUsecase(
        credentials: authenticationCredentials,
      );

      verify(() {
        return mockAuthenticationRepository.authenticate(
          authenticationCredentials,
        );
      }).called(1);

      verifyNever(() {
        return mockAuthorizationRepository.saveCredentials(
          any<AuthorizationCredentials>(),
        );
      });

      expect(result.isFailure, true);
      expect(result.failure, ServerFailure());
    },
  );

  test(
    'returns Failure(ConnectionFailure) on an authentication call '
    'that failed with ConnectionFailure',
    () async {
      when(() {
        return mockAuthenticationRepository.authenticate(
          authenticationCredentials,
        );
      }).thenAnswer((_) async => Failure(ConnectionFailure()));

      final result = await authenticateUsecase(
        credentials: authenticationCredentials,
      );

      verify(() {
        return mockAuthenticationRepository.authenticate(
          authenticationCredentials,
        );
      }).called(1);

      verifyNever(() {
        return mockAuthorizationRepository.saveCredentials(
          any<AuthorizationCredentials>(),
        );
      });

      expect(result.isFailure, true);
      expect(result.failure, ConnectionFailure());
    },
  );
}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository<FakeAuthenticationCredentials> {}

class MockAuthorizationRepository extends Mock
    implements AuthorizationRepository {}

class FakeAuthenticationCredentials extends Fake
    implements AuthenticationCredentials {}

class FakeAuthorizationCredentials extends Fake
    implements AuthorizationCredentials {}

class FakeApplicationFailure extends Fake implements ApplicationFailure {}
