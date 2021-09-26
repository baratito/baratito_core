import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/auth/application/repositories/repositories.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class GetAuthorizationCredentialsUsecase {
  final AuthorizationRepository _authorizationRepository;

  GetAuthorizationCredentialsUsecase(this._authorizationRepository);

  Future<Result<AuthorizationCredentials, ApplicationFailure>> call() async {
    return _authorizationRepository.getCredentials();
  }
}
