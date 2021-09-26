import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/configs/configs.dart';

@lazySingleton
class ApiProviderBaseUrl {
  String get url => Constants.apiBaseUrl;
}
