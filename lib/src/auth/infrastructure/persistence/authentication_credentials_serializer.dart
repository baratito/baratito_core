import 'package:baratito_core/src/auth/domain/domain.dart';

abstract class AuthenticationCredentialsSerializer<
    A extends AuthenticationCredentials> {
  Map<String, dynamic> toMap(A credentials) {
    throw UnimplementedError();
  }
}
