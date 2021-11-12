import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_settings_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/shopping_list_item_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/api_shopping_lists_provider_endpoint.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/remote_shopping_lists_provider.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/shopping_list_create_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/shopping_list_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/shopping_list_item_update_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/shopping_list_update_model_serializer.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: RemoteShoppingListsProvider)
class ApiShoppingListsProvider implements RemoteShoppingListsProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiShoppingListsProviderEndpoint _shoppingListsEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final ShoppingListModelSerializer _shoppingListModelSerializer;
  final ShoppingListCreateModelSerializer _shoppingListCreateModelSerializer;
  final ShoppingListUpdateModelSerializer _shoppingListUpdateModelSerializer;
  final ShoppingListItemUpdateModelSerializer _itemUpdateModelSerializer;
  final ShoppingListItemModelSerializer _itemModelSerializer;
  final PurchaseSettingsSerializer _purchaseSettingsSerializer;
  final PurchaseListModelSerializer _purchaseListModelSerializer;

  ApiShoppingListsProvider(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._shoppingListsEndpoint,
    this._apiAuthorizationService,
    this._shoppingListModelSerializer,
    this._shoppingListCreateModelSerializer,
    this._shoppingListUpdateModelSerializer,
    this._itemUpdateModelSerializer,
    this._itemModelSerializer,
    this._purchaseSettingsSerializer,
    this._purchaseListModelSerializer,
  );

  @override
  Future<List<ShoppingListModel>> getAll() async {
    final endpoint =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final response = await _apiClient.get(uri, headers: headers);
    final models = _getShoppingListResultsList(response);

    return models;
  }

  @override
  Future<ShoppingListModel> create(ShoppingListCreateModel model) async {
    final endpoint =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final modelMap = await _apiClient.post(
      uri,
      body: _shoppingListCreateModelSerializer.toMap(model),
      headers: headers,
    );
    final shoppingListModel = _shoppingListModelSerializer.fromMap(modelMap);

    return shoppingListModel;
  }

  @override
  Future<ShoppingListModel> update(ShoppingListUpdateModel model) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final endpoint = '$baseUrl${model.id}/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final modelMap = await _apiClient.patch(
      uri,
      body: _shoppingListUpdateModelSerializer.toMap(model),
      headers: headers,
    );
    final shoppingListModel = _shoppingListModelSerializer.fromMap(modelMap);

    return shoppingListModel;
  }

  @override
  Future<void> delete(ShoppingList shoppingList) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final endpoint = '$baseUrl${shoppingList.id}/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    await _apiClient.delete(uri, headers: headers);
  }

  @override
  Future<List<ShoppingListItemModel>> updateItems(
    ShoppingList shoppingList,
    List<ShoppingListItemUpdateModel> models,
  ) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final endpoint = '$baseUrl${shoppingList.id}/items/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final body = models.map((model) {
      return _itemUpdateModelSerializer.toMap(model);
    }).toList();

    final response = await _apiClient.post(uri, body: body, headers: headers);
    final shoppingListItemModels = _getShoppingListItemsResultsList(response);

    return shoppingListItemModels;
  }

  @override
  Future<List<ShoppingListItemModel>> getItems(
    ShoppingList shoppingList,
  ) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final endpoint = '$baseUrl${shoppingList.id}/items/';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final response = await _apiClient.get(uri, headers: headers);
    final shoppingListItemModels = _getShoppingListItemsResultsList(response);

    return shoppingListItemModels;
  }

  @override
  Future<PurchaseListModel> startPurchase(
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) async {
    final baseUrl =
        '${_apiProviderBaseUrl.url}${_shoppingListsEndpoint.endpoint}';
    final endpoint = '$baseUrl${shoppingList.id}/buy';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final body = _purchaseSettingsSerializer.toMap(purchaseSettings);

    final modelMap = await _apiClient.post(uri, body: body, headers: headers);
    final purchaseListModel = _purchaseListModelSerializer.fromMap(modelMap);

    return purchaseListModel;
  }

  List<ShoppingListModel> _getShoppingListResultsList(
      Map<String, dynamic> response) {
    final jsonResults = response['results'] as List;
    final models = jsonResults.map<ShoppingListModel>((modelMap) {
      return _shoppingListModelSerializer.fromMap(modelMap);
    });
    return models.toList();
  }

  List<ShoppingListItemModel> _getShoppingListItemsResultsList(
    Map<String, dynamic> response,
  ) {
    final jsonResults = response['results'] as List;
    final models = jsonResults.map<ShoppingListItemModel>((modelMap) {
      return _itemModelSerializer.fromMap(modelMap);
    });
    return models.toList();
  }
}
