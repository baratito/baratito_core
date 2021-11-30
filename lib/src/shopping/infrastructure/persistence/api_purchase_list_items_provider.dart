import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_item_update_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/remote_purchase_list_items_provider.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/api_purchase_list_items_provider_endpoint.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_item_model_serializer.dart';

@LazySingleton(as: RemotePurchaseListItemsProvider)
class ApiPurchaseListItemsProvider implements RemotePurchaseListItemsProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiPurchaseListItemsProviderEndpoint _purchaseListItemsEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final PurchaseListItemModelSerializer _modelSerializer;
  final PurchaseListItemUpdateModelSerializer _updateModelSerializer;

  ApiPurchaseListItemsProvider(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._purchaseListItemsEndpoint,
    this._apiAuthorizationService,
    this._modelSerializer,
    this._updateModelSerializer,
  );

  @override
  Future<PurchaseListItemModel> update(
    PurchaseListItemUpdateModel updateModel,
  ) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_purchaseListItemsEndpoint.endpoint}';
    final endpoint = '$baseUrl${updateModel.id}/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final modelMap = await _apiClient.patch(
      uri,
      body: _updateModelSerializer.toMap(updateModel),
      headers: headers,
    );
    final purchaseListModel = _modelSerializer.fromMap(modelMap);

    return purchaseListModel;
  }
}
