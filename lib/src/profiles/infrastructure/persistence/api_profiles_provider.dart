import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/profiles/application/application.dart';
import 'package:baratito_core/src/profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart';
import 'package:baratito_core/src/profiles/infrastructure/persistence/profile_model_serializer.dart';
import 'package:baratito_core/src/profiles/infrastructure/persistence/remote_profiles_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemoteProfilesProvider)
class ApiProfilesProvider implements RemoteProfilesProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiProfilesProviderEndpoint _profilesEndpoint;
  final ApiAuthorizationService _authService;
  final ProfileModelSerializer _modelSerializer;

  ApiProfilesProvider(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._profilesEndpoint,
    this._authService,
    this._modelSerializer,
  );

  @override
  Future<ProfileModel> getAuthenticatedUserProfile() async {
    final endpoint = '${_apiProviderBaseUrl.url}${_profilesEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);

    final token = await _authService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final profileMap = await _apiClient.get(uri, headers: headers);
    final profileModel = _modelSerializer.fromMap(profileMap);
    return profileModel;
  }
}
