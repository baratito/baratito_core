import 'package:baratito_core/baratito_core.dart';

abstract class ApplicationFailure extends Equatable {
  const ApplicationFailure();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends ApplicationFailure {
  const ServerFailure();
}

class NotFoundFailure extends ApplicationFailure {
  const NotFoundFailure();
}

class ConnectionFailure extends ApplicationFailure {
  const ConnectionFailure();
}

class ClientFailure extends ApplicationFailure {
  final String description;

  const ClientFailure(this.description);
}
