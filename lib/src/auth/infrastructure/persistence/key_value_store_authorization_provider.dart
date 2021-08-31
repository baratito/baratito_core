import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/auth/domain/domain.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/authorization_credentials_serializer.dart';
import 'package:baratito_core/src/auth/infrastructure/persistence/local_authorization_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@Injectable(as: LocalAuthorizationProvider)
class KeyValueStoreAuthorizationProvider implements LocalAuthorizationProvider {
  final KeyValueStore _keyValueStore;
  final AuthorizationCredentialsSerializer _authorizationCredentialsSerializer;

  KeyValueStoreAuthorizationProvider(
    this._keyValueStore,
    this._authorizationCredentialsSerializer,
  );

  static const keyValueStoreKey = '__authorization_credentials__';

  @override
  Future<void> saveCredentials(AuthorizationCredentials credentials) async {
    final credentialsMap = _authorizationCredentialsSerializer.toMap(
      credentials,
    );
    final credentialsJson = json.encode(credentialsMap);
    await _keyValueStore.setString(keyValueStoreKey, credentialsJson);
  }

  @override
  Future<Optional<AuthorizationCredentials>> getCredentials() async {
    final credentialsOptional = await _keyValueStore.getString(
      keyValueStoreKey,
    );
    if (credentialsOptional.isEmpty) return Optional.empty();

    final credentialsJson = credentialsOptional.value;
    final credentialsMap = json.decode(credentialsJson);
    final credentials = _authorizationCredentialsSerializer.fromMap(
      credentialsMap,
    );

    return Optional.of(credentials);
  }

  @override
  Future<void> removeCredentials() {
    return _keyValueStore.remove(keyValueStoreKey);
  }
}
