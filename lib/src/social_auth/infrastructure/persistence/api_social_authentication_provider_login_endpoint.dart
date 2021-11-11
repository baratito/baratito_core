import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class ApiSocialAuthenticationProviderLoginEndpoint extends ApiProviderEndpoint {
  const ApiSocialAuthenticationProviderLoginEndpoint() : super('login/');
}
