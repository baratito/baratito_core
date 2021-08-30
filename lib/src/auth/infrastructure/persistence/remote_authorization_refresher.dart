import 'package:baratito_core/src/auth/domain/domain.dart';

abstract class RemoteAuthorizationRefresher {
  Future<AuthorizationCredentials> refresh(
    AuthorizationCredentials credentials,
  );
}
