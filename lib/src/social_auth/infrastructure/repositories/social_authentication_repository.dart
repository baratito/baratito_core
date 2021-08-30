import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/social_auth/domain/domain.dart';
import 'package:baratito_core/src/social_auth/infrastructure/persistence/persistence.dart';
import 'package:baratito_core/src/shared/shared.dart';

typedef AuthenticationRepositoryAlias
    = AuthenticationRepository<SocialAuthenticationCredentials>;

@Singleton(as: AuthenticationRepositoryAlias)
class SocialAuthenticationRepository
    implements AuthenticationRepository<SocialAuthenticationCredentials> {
  final RemoteSocialAuthenticationProvider _remoteSocialAuthenticationProvider;

  SocialAuthenticationRepository(this._remoteSocialAuthenticationProvider);

  @override
  Future<Result<AuthorizationCredentials, ApplicationFailure>> authenticate(
    SocialAuthenticationCredentials credentials,
  ) async {
    try {
      final authorizationCredentials =
          await _remoteSocialAuthenticationProvider.authenticate(credentials);
      return Success(authorizationCredentials);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  ApplicationFailure _parseException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure();
    } else if (exception is ConnectionException) {
      return ConnectionFailure();
    }

    throw Exception('Unexpected exception');
  }
}
