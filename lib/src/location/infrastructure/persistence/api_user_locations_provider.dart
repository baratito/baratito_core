import 'package:baratito_core/src/location/infrastructure/persistence/user_location_update_model_serializer.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/location/application/application.dart';
import 'package:baratito_core/src/location/infrastructure/persistence/api_user_locations_provider_endpoint.dart';
import 'package:baratito_core/src/location/infrastructure/persistence/remote_user_locations_provider.dart';
import 'package:baratito_core/src/location/infrastructure/persistence/user_location_model_serializer.dart';
import 'package:baratito_core/src/location/infrastructure/persistence/user_location_create_model_serializer.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemoteUserLocationsProvider)
class RemoteUserLocationsProviderImpl implements RemoteUserLocationsProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiUserLocationsProviderEndpoint _userLocationsEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final UserLocationModelSerializer _userLocationModelSerializer;
  final UserLocationCreateModelSerializer _userLocationCreateModelSerializer;
  final UserLocationUpdateModelSerializer _userLocationUpdateModelSerializer;

  RemoteUserLocationsProviderImpl(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._userLocationsEndpoint,
    this._apiAuthorizationService,
    this._userLocationModelSerializer,
    this._userLocationCreateModelSerializer,
    this._userLocationUpdateModelSerializer,
  );

  @override
  Future<List<UserLocationModel>> getAll() async {
    final endpoint =
        '${_apiProviderBaseUrl.url}${_userLocationsEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final response = await _apiClient.get(uri, headers: headers);
    final models = _getResultsList(response);

    return models;
  }

  @override
  Future<UserLocationModel> create(UserLocationCreateModel model) async {
    final endpoint =
        '${_apiProviderBaseUrl.url}${_userLocationsEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final modelMap = await _apiClient.post(
      uri,
      body: _userLocationCreateModelSerializer.toMap(model),
      headers: headers,
    );
    final userLocationModel = _userLocationModelSerializer.fromMap(modelMap);

    return userLocationModel;
  }

  @override
  Future<UserLocationModel> enable(UserLocationUpdateModel model) async {
    final baseEndpoint =
        '${_apiProviderBaseUrl.url}${_userLocationsEndpoint.endpoint}';
    final endpoint = '$baseEndpoint${model.id}/enable/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final modelMap = await _apiClient.patch(
      uri,
      headers: headers,
    );
    final userLocationModel = _userLocationModelSerializer.fromMap(modelMap);

    return userLocationModel;
  }

  List<UserLocationModel> _getResultsList(Map<String, dynamic> response) {
    final jsonResults = response['results'] as List;
    final models = jsonResults.map<UserLocationModel>((modelMap) {
      return _userLocationModelSerializer.fromMap(modelMap);
    });
    return models.toList();
  }
}
