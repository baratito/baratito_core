import 'dart:async';

import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/auth/application/repositories/repositories.dart';
import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

class AuthenticateUsecase<A extends AuthenticationCredentials> {
  final AuthenticationRepository<A> _authenticationRepository;
  final AuthorizationRepository _authorizationRepository;

  AuthenticateUsecase(
    this._authenticationRepository,
    this._authorizationRepository,
  );

  Future<Result<AuthorizationCredentials, ApplicationFailure>> call({
    required A credentials,
  }) async {
    final result = await _authenticationRepository.authenticate(credentials);

    if (result.isFailure) return Failure(result.failure);

    final authorizationCredentials = result.success;
    unawaited(
      _authorizationRepository.saveCredentials(authorizationCredentials),
    );

    return Success(authorizationCredentials);
  }
}
