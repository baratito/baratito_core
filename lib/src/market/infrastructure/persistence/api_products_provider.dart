import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/api_products_provider_endpoint.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/product_model_serializer.dart';
import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/remote_products_provider.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemoteProductsProvider)
class RemoteProductsProviderImpl implements RemoteProductsProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiProductsProviderEndpoint _productsEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final ProductModelSerializer _modelSerializer;

  RemoteProductsProviderImpl(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._productsEndpoint,
    this._apiAuthorizationService,
    this._modelSerializer,
  );

  @override
  Future<PagedList<ProductModel>> search(
    PageInfo pageInfo,
    String query, [
    Category? category,
  ]) async {
    final limit = pageInfo.pageSize;
    final offset = limit * (pageInfo.pageNumber - 1);
    final url = '${_apiProviderBaseUrl.url}${_productsEndpoint.endpoint}';
    final params = ApiQueryParamList([
      ApiQueryParam('q', query),
      ApiQueryParam('limit', '$limit'),
      ApiQueryParam('offset', '$offset'),
    ]);
    if (category != null) {
      params.add(ApiQueryParam('category', '${category.index}'));
    }
    var uriString = '$url?${params.buildQuery()}';
    final uri = Uri.parse(uriString);

    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final response = await _apiClient.get(uri, headers: headers);
    final models = _getResultsList(response);
    final totalSize = response['total'] as int;
    final resultsPagedList = PagedList(totalSize: totalSize, elements: models);

    return resultsPagedList;
  }

  List<ProductModel> _getResultsList(Map<String, dynamic> response) {
    final jsonResults = response['results'] as List;
    final models = jsonResults.map<ProductModel>((modelMap) {
      return _modelSerializer.fromMap(modelMap);
    });
    return models.toList();
  }
}
