abstract class NetworkException implements Exception {}

class ServerException implements NetworkException {}

class NotFoundException implements NetworkException {}

class ConnectionException implements NetworkException {}

class ClientException implements NetworkException {
  final String description;

  ClientException(this.description);
}

class UnhandledNetworkException implements NetworkException {}
