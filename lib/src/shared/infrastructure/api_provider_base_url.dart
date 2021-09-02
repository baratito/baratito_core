import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/configs/configs.dart';

@singleton
class ApiProviderBaseUrl {
  String get url => Constants.apiBaseUrl;
}
