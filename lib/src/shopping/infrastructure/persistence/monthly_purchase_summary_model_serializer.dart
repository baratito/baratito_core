import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_model_serializer.dart';
import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class MonthlyPurchaseSummaryModelSerializer {
  final PurchaseListModelSerializer _purchaseListModelSerializer;

  MonthlyPurchaseSummaryModelSerializer(this._purchaseListModelSerializer);

  MonthlyPurchaseSummaryModel fromMap(Map<String, dynamic> map) {
    return MonthlyPurchaseSummaryModel(
      name: map['name'],
      abbreviation: map['abbreviation'],
      total: _totalFromMap(map),
      purchases: _purchasesListFromMap(map),
    );
  }

  double _totalFromMap(Map<String, dynamic> map) {
    final value = map['total'];
    if (value is int) return value.toDouble();
    return value;
  }

  List<PurchaseListModel> _purchasesListFromMap(Map<String, dynamic> map) {
    final purchases = map['purchases'] as List;
    final models = purchases.map((e) {
      return _purchaseListModelSerializer.fromMap(e);
    }).toList();
    return models;
  }
}
