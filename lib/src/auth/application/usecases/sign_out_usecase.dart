import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/application/repositories/repositories.dart';

@lazySingleton
class SignOutUsecase {
  final AuthorizationRepository _authorizationRepository;

  SignOutUsecase(this._authorizationRepository);

  Future<void> call() async {
    await _authorizationRepository.removeCredentials();
  }
}
