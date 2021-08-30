import 'package:baratito_core/baratito_core.dart';

abstract class ApplicationFailure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends ApplicationFailure {}

class NotFoundFailure extends ApplicationFailure {}

class ConnectionFailure extends ApplicationFailure {}
