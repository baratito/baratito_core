import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/api_purchase_lists_provider_endpoint.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/remote_purchase_lists_provider.dart';

@LazySingleton(as: RemotePurchaseListsProvider)
class ApiPurchaseListsProvider implements RemotePurchaseListsProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiPurchaseListsProviderEndpoint _purchaseListsEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final PurchaseListModelSerializer _purchaseListModelSerializer;

  ApiPurchaseListsProvider(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._purchaseListsEndpoint,
    this._apiAuthorizationService,
    this._purchaseListModelSerializer,
  );

  @override
  Future<PurchaseListModel> complete(PurchaseList purchaseList) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_purchaseListsEndpoint.endpoint}';
    final endpoint = '$baseUrl${purchaseList.id}/complete/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final modelMap = await _apiClient.patch(uri, headers: headers);
    final purchaseListModel = _purchaseListModelSerializer.fromMap(modelMap);

    return purchaseListModel;
  }
}
