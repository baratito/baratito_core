import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client, Response;
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/infrastructure/exceptions.dart';

typedef RequestFunction = Future<Response> Function();

@lazySingleton
class ApiClient {
  final Client _client;

  const ApiClient(this._client);

  Future<Map<String, dynamic>> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final response = await _makeRequest(
      () => _client.get(uri, headers: headers),
    );
    if (response.statusCode >= 300) {
      throw _parseResponseError(response);
    }
    return _parseResponseBody(response);
  }

  Future<Map<String, dynamic>> post(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final defaultHeaders = {'Content-Type': 'application/json'};
    if (headers != null && !headers.containsKey('Content-Type')) {
      headers.addAll(defaultHeaders);
    }
    final encodedRequestBody = json.encode(body);
    final response = await _makeRequest(
      () {
        return _client.post(
          uri,
          headers: headers,
          body: encodedRequestBody,
        );
      },
    );
    if (response.statusCode >= 300) {
      throw _parseResponseError(response);
    }
    return _parseResponseBody(response);
  }

  Future<Map<String, dynamic>> patch(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final defaultHeaders = {'Content-Type': 'application/json'};
    if (headers != null && !headers.containsKey('Content-Type')) {
      headers.addAll(defaultHeaders);
    }
    final encodedRequestBody = json.encode(body);
    final response = await _makeRequest(
      () {
        return _client.patch(
          uri,
          headers: headers,
          body: encodedRequestBody,
        );
      },
    );
    if (response.statusCode >= 300) {
      throw _parseResponseError(response);
    }
    return _parseResponseBody(response);
  }

  Map<String, String> buildAuthorizationHeaders(String token) {
    return {'Authorization': 'Bearer $token'};
  }

  Future<Response> _makeRequest(RequestFunction requestFunction) async {
    try {
      return await requestFunction();
    } on SocketException {
      throw ConnectionException();
    }
  }

  Map<String, dynamic> _parseResponseBody(Response response) {
    final body = response.body;
    final decodedBody = json.decode(body) as Map<String, dynamic>;
    return decodedBody;
  }

  NetworkException _parseResponseError(Response response) {
    final httpStatusCode = response.statusCode;
    if (httpStatusCode >= 500) return ServerException();
    if (httpStatusCode == 404) return NotFoundException();
    return UnhandledNetworkException();
  }
}
