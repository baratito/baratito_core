import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/auth/auth.dart';

void main() {
  late MockAuthorizationRepository mockAuthorizationRepository;
  late SignOutUsecase signOutUsecase;

  setUp(() {
    mockAuthorizationRepository = MockAuthorizationRepository();
    signOutUsecase = SignOutUsecase(
      mockAuthorizationRepository,
    );
  });

  test('makes repository call to remove credentials successfully', () async {
    when(() => mockAuthorizationRepository.removeCredentials())
        .thenAnswer((_) async {});

    await signOutUsecase();

    verify(() => mockAuthorizationRepository.removeCredentials()).called(1);
  });
}

class MockAuthorizationRepository extends Mock
    implements AuthorizationRepository {}
