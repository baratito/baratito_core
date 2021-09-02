import 'package:baratito_core/src/shared/application/application.dart';
import 'package:baratito_core/src/shared/infrastructure/api_authorization_service.dart';
import 'package:baratito_core/src/shared/infrastructure/api_client.dart';
import 'package:baratito_core/src/shared/infrastructure/api_provider_base_url.dart';
import 'package:baratito_core/src/shared/infrastructure/api_provider_endpoint.dart';
import 'package:baratito_core/src/shared/infrastructure/model_serializer.dart';

class ApiProvider<M extends Model> {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiBaseUrl;
  final ApiProviderEndpoint _apiEndpoint;
  final ApiAuthorizationService _authService;
  final ModelSerializer<M> _modelSerializer;

  ApiProvider(
    this._apiClient,
    this._apiBaseUrl,
    this._apiEndpoint,
    this._authService,
    this._modelSerializer,
  );

  String get resourceUrl => '${_apiBaseUrl.url}${_apiEndpoint.endpoint}';

  Future<M> getById(String id) async {
    final uri = Uri.parse('$resourceUrl$id/');
    final headers = await _getAuthorizationHeaders();
    final response = await _apiClient.get(uri, headers: headers);
    final model = _modelSerializer.fromMap(response);
    return model;
  }

  Future<Map<String, String>> _getAuthorizationHeaders() async {
    final token = await _authService.getToken();
    return _apiClient.buildAuthorizationHeaders(token);
  }
}
