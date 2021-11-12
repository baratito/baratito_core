import 'package:baratito_core/baratito_core.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_establishment_model_serializer.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PurchaseListModelSerializer {
  final PurchaseListItemEstablishmentModelSerializer
      _establishmentModelSerializer;

  PurchaseListModelSerializer(this._establishmentModelSerializer);

  PurchaseListModel fromMap(Map<String, dynamic> map) {
    return PurchaseListModel(
      id: map['id'],
      name: map['name'],
      totalDistanceInMeters: map['distance'],
      duration: Duration(seconds: map['duration']),
      estimatedValue: map['estimated_price'],
      status: PurchaseListStatus.values[map['status']],
      establishments: _establishmentsFromMap(map),
    );
  }

  List<PurchaseListItemEstablishmentModel> _establishmentsFromMap(
      Map<String, dynamic> map) {
    final establishmentJsonList = map['establishments'] as List;
    final establishmentModelsList = establishmentJsonList
        .map<PurchaseListItemEstablishmentModel>((modelMap) {
      return _establishmentModelSerializer.fromMap(modelMap);
    });

    return establishmentModelsList.toList();
  }
}
