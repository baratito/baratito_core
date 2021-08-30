import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientModule {
  @singleton
  Client get httpClient => Client();
}
