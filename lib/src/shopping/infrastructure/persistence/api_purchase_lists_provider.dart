import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/monthly_purchase_summary_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/api_purchase_summary_provider_endpoint.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/api_purchase_lists_provider_endpoint.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_model_serializer.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/remote_purchase_lists_provider.dart';

@LazySingleton(as: RemotePurchaseListsProvider)
class ApiPurchaseListsProvider implements RemotePurchaseListsProvider {
  final ApiClient _apiClient;
  final ApiProviderBaseUrl _apiProviderBaseUrl;
  final ApiPurchaseListsProviderEndpoint _purchaseListsEndpoint;
  final ApiPurchaseSummaryProviderEndpoint _purchaseSummaryEndpoint;
  final ApiAuthorizationService _apiAuthorizationService;
  final PurchaseListModelSerializer _purchaseListModelSerializer;
  final MonthlyPurchaseSummaryModelSerializer _summarySerializer;

  ApiPurchaseListsProvider(
    this._apiClient,
    this._apiProviderBaseUrl,
    this._purchaseListsEndpoint,
    this._purchaseSummaryEndpoint,
    this._apiAuthorizationService,
    this._purchaseListModelSerializer,
    this._summarySerializer,
  );

  @override
  Future<PurchaseListModel> completePurchase(PurchaseList purchaseList) async {
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

  @override
  Future<List<MonthlyPurchaseSummaryModel>> getSummaries() async {
    final endpoint =
        '${_apiProviderBaseUrl.url}${_purchaseSummaryEndpoint.endpoint}';
    final uri = Uri.parse(endpoint);
    final token = await _apiAuthorizationService.getToken();
    final headers = _apiClient.buildAuthorizationHeaders(token);

    final response = await _apiClient.get(uri, headers: headers);
    final summaryModels = _getSummariesResultsList(response);

    return summaryModels;
  }

  List<MonthlyPurchaseSummaryModel> _getSummariesResultsList(
    Map<String, dynamic> response,
  ) {
    final jsonResults = response['results'] as List;
    final models = jsonResults.map<MonthlyPurchaseSummaryModel>((modelMap) {
      return _summarySerializer.fromMap(modelMap);
    });
    return models.toList();
  }
}
