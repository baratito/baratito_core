import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/market/domain/product.dart';
import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/api_prices_provider_endpoint.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/price_model_serializer.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/remote_prices_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemotePricesProvider)
class RemotePricesProviderImpl implements RemotePricesProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiPricesProviderEndpoint _pricesEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final PriceModelSerializer _modelSerializer;

  RemotePricesProviderImpl(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._pricesEndpoint,
    this._apiAuthorizationService,
    this._modelSerializer,
  );

  @override
  Future<List<PriceModel>> getByProduct(Product product) async {
    final baseEndpoint =
        '${_apiProviderBaseUrl.url}${_pricesEndpoint.endpoint}';
    final endpoint = '${baseEndpoint}product/${product.id}/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final response = await _apiClient.get(uri, headers: headers);
    final models = _getResultsList(response);

    return models;
  }

  List<PriceModel> _getResultsList(Map<String, dynamic> response) {
    final jsonResults = response['results'] as List;
    final models = jsonResults.map<PriceModel>((modelMap) {
      return _modelSerializer.fromMap(modelMap);
    });
    return models.toList();
  }
}
