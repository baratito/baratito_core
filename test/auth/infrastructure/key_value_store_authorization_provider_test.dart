import 'dart:convert';

import 'package:baratito_core/baratito_core.dart';
import 'package:mocktail/mocktail.dart';

import 'package:baratito_core/src/auth/auth.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late MockKeyValueStore mockKeyValueStore;
  late MockAuthorizationCredentialsSerializer
      mockAuthorizationCredentialsSerializer;
  late KeyValueStoreAuthorizationProvider keyValueStoreAuthorizationProvider;

  setUp(() {
    mockKeyValueStore = MockKeyValueStore();
    mockAuthorizationCredentialsSerializer =
        MockAuthorizationCredentialsSerializer();
    keyValueStoreAuthorizationProvider = KeyValueStoreAuthorizationProvider(
      mockKeyValueStore,
      mockAuthorizationCredentialsSerializer,
    );
  });

  final credentials = AuthorizationCredentials(
    accessToken: 'token',
    refreshToken: 'refresh-token',
    accessTokenExpiration: DateTime(2020),
    refreshTokenExpiration: DateTime(2020),
  );
  final credentialsMap = {
    'access_token': 'token',
    'refresh_token': 'refresh-token',
    'expiration_access_token': '2020-01-01T00:00:00.000',
    'expiration_refresh_token': '2020-01-01T00:00:00.000',
  };
  final credentialsJson = json.encode(credentialsMap);
  test('saves credentials successfully', () async {
    when(() => mockAuthorizationCredentialsSerializer.toMap(credentials))
        .thenAnswer((_) => credentialsMap);

    when(() {
      return mockKeyValueStore.setString(
        KeyValueStoreAuthorizationProvider.keyValueStoreKey,
        credentialsJson,
      );
    }).thenAnswer((_) async {});

    await keyValueStoreAuthorizationProvider.saveCredentials(credentials);

    verify(() => mockAuthorizationCredentialsSerializer.toMap(credentials))
        .called(1);
    verify(() {
      return mockKeyValueStore.setString(
        KeyValueStoreAuthorizationProvider.keyValueStoreKey,
        credentialsJson,
      );
    }).called(1);
  });

  test(
    'returns Optional(AuthorizationCredentials) on a successful '
    'getCredentials() call',
    () async {
      when(() => mockAuthorizationCredentialsSerializer.fromMap(credentialsMap))
          .thenAnswer((_) => credentials);

      when(() {
        return mockKeyValueStore.getString(
          KeyValueStoreAuthorizationProvider.keyValueStoreKey,
        );
      }).thenAnswer((_) async => Optional.of(credentialsJson));

      final optional =
          await keyValueStoreAuthorizationProvider.getCredentials();

      verify(() {
        return mockAuthorizationCredentialsSerializer.fromMap(credentialsMap);
      }).called(1);
      verify(() {
        return mockKeyValueStore.getString(
          KeyValueStoreAuthorizationProvider.keyValueStoreKey,
        );
      }).called(1);

      expect(optional.isPresent, true);
      expect(optional.value, credentials);
    },
  );

  test(
    'returns Optional.empty() on a getCredentials() call '
    'where no credentials exist ',
    () async {
      when(() => mockAuthorizationCredentialsSerializer.fromMap(credentialsMap))
          .thenAnswer((_) => credentials);

      when(() {
        return mockKeyValueStore.getString(
          KeyValueStoreAuthorizationProvider.keyValueStoreKey,
        );
      }).thenAnswer((_) async => Optional.empty());

      final optional =
          await keyValueStoreAuthorizationProvider.getCredentials();

      verifyNever(() {
        return mockAuthorizationCredentialsSerializer.fromMap(credentialsMap);
      });
      verify(() {
        return mockKeyValueStore.getString(
          KeyValueStoreAuthorizationProvider.keyValueStoreKey,
        );
      }).called(1);

      expect(optional.isEmpty, true);
    },
  );

  test('removes credentials successfully', () async {
    when(() {
      return mockKeyValueStore.remove(
        KeyValueStoreAuthorizationProvider.keyValueStoreKey,
      );
    }).thenAnswer((_) async {});

    await keyValueStoreAuthorizationProvider.removeCredentials();

    verify(() {
      return mockKeyValueStore.remove(
        KeyValueStoreAuthorizationProvider.keyValueStoreKey,
      );
    }).called(1);
  });
}

class MockKeyValueStore extends Mock implements KeyValueStore {}

class MockAuthorizationCredentialsSerializer extends Mock
    implements AuthorizationCredentialsSerializer {}
