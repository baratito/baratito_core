import 'package:injectable/injectable.dart';

@singleton
class ApiProviderBaseUrl {
  String get url => 'https://api.baratito.app/api/';
}
