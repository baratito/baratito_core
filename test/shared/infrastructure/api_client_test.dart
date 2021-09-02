import 'dart:io';

import 'package:http/testing.dart';
import 'package:http/http.dart' show Response, Client;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/shared/shared.dart';

void main() {
  group('on get()', () {
    final uri = Uri.parse('https://example.com');
    test(
      'returns a Map<String, dynamic> body when answered with code 2xx',
      () async {
        final successfulResponseJson = '{\"data\": \"Success!\"}';
        final expectedResponseMap = <String, dynamic>{'data': 'Success!'};

        final mockHttpClient = MockClient((req) async {
          return Response(successfulResponseJson, 200, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        final response = await apiClient.get(uri);

        expect(response, expectedResponseMap);
      },
    );

    test(
      'throws a NotFoundException when answered with code 404',
      () async {
        final mockHttpClient = MockClient((req) async {
          return Response('', 404, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.get(uri),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      'throws a ServerException when answered with code 5xx',
      () async {
        final mockHttpClient = MockClient((req) async {
          return Response('', 500, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.get(uri),
          throwsA(isA<ServerException>()),
        );
      },
    );

    test(
      'throws a ConnectionException when the client throws a SocketException',
      () async {
        final mockHttpClient = MockClient((req) async {
          throw SocketException('');
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.get(uri),
          throwsA(isA<ConnectionException>()),
        );
      },
    );

    test(
      'throws an UnhandledNetworkException when answered with '
      'codes that are not 2xx, 404 or 5xx',
      () async {
        final mockHttpClient = MockClient((req) async {
          return Response('', 300, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.get(uri),
          throwsA(isA<UnhandledNetworkException>()),
        );
      },
    );
  });

  group('on post()', () {
    final uri = Uri.parse('https://example.com');
    final requestBody = {'id': 1};
    test('returns a Response body when answered with code 2xx', () async {
      final successfulResponseJson = '{\"data\": \"Success!\"}';
      final expectedResponseMap = <String, dynamic>{'data': 'Success!'};

      final mockHttpClient = MockClient((req) async {
        return Response(successfulResponseJson, 201, request: req);
      });
      final apiClient = ApiClient(mockHttpClient);

      final response = await apiClient.post(uri, body: requestBody);

      expect(response, expectedResponseMap);
    });

    test(
      'throws a NotFoundException when answered with code 404',
      () async {
        final mockHttpClient = MockClient((req) async {
          return Response('', 404, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.post(uri, body: requestBody),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      'throws a ServerException when answered with code 5xx',
      () async {
        final mockHttpClient = MockClient((req) async {
          return Response('', 500, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.post(uri, body: requestBody),
          throwsA(isA<ServerException>()),
        );
      },
    );

    test(
      'throws a ConnectionException when the client throws a SocketException',
      () async {
        final mockHttpClient = MockClient((req) async {
          throw SocketException('');
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.post(uri, body: requestBody),
          throwsA(isA<ConnectionException>()),
        );
      },
    );

    test(
      'throws an UnhandledNetworkException when answered with '
      'codes that are not 2xx, 404 or 5xx',
      () async {
        final mockHttpClient = MockClient((req) async {
          return Response('', 300, request: req);
        });
        final apiClient = ApiClient(mockHttpClient);

        expect(
          () async => await apiClient.post(uri, body: requestBody),
          throwsA(isA<UnhandledNetworkException>()),
        );
      },
    );
  });

  test(
    'buildAuthorizationHeaders() returns an appropriately formatted Map',
    () {
      const token = 'token';
      const expectedHeaders = {'Authorization': 'Bearer $token'};

      final apiClient = ApiClient(FakeClient());

      final headers = apiClient.buildAuthorizationHeaders(token);

      expect(headers, expectedHeaders);
    },
  );
}

class FakeClient extends Fake implements Client {}
