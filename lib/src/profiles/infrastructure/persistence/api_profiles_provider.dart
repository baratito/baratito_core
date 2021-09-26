import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/profiles/application/application.dart';
import 'package:baratito_core/src/profiles/infrastructure/persistence/remote_profiles_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemoteProfilesProvider)
class ApiProfilesProvider implements RemoteProfilesProvider {
  // TODO: replace all of tfhis with an ApiProvider once we have a proper
  // profile endpoint
  final ApiClient _apiClient;
  final ApiAuthorizationService _authService;
  final ModelSerializer<ProfileModel> _modelSerializer;

  ApiProfilesProvider(
    this._apiClient,
    this._authService,
    this._modelSerializer,
  );

  @override
  Future<ProfileModel> getAuthenticatedUserProfile() async {
    final endpoint = 'https://api.baratito.app/api/profile/';
    final uri = Uri.parse(endpoint);

    final token = await _authService.getToken();
    final headers = {'Authorization': 'Bearer $token'};

    final profileMap = await _apiClient.get(uri, headers: headers);
    final profileModel = _modelSerializer.fromMap(profileMap);
    return profileModel;
  }
}
