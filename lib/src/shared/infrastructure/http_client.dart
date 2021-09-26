import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientModule {
  @lazySingleton
  Client get httpClient => Client();
}
