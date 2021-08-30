abstract class NetworkException implements Exception {}

class ServerException implements NetworkException {}

class NotFoundException implements NetworkException {}

class ConnectionException implements NetworkException {}

class UnhandledNetworkException implements NetworkException {}
