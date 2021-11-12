import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_item_model_serializer.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/establishment_model_serializer.dart';
import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class PurchaseListItemEstablishmentModelSerializer {
  final EstablishmentModelSerializer _establishmentModelSerializer;
  final PurchaseListItemModelSerializer _purchaseListItemModelSerializer;

  PurchaseListItemEstablishmentModelSerializer(
    this._establishmentModelSerializer,
    this._purchaseListItemModelSerializer,
  );

  PurchaseListItemEstablishmentModel fromMap(Map<String, dynamic> map) {
    return PurchaseListItemEstablishmentModel(
      id: 1,
      establishment: _establishmentModelSerializer.fromMap(
        map['establishment'],
      ),
      items: _itemsFromMap(map),
    );
  }

  List<PurchaseListItemModel> _itemsFromMap(Map<String, dynamic> map) {
    final itemJsonList = map['purchase_items'] as List;
    final itemModelsList = itemJsonList.map<PurchaseListItemModel>((modelMap) {
      return _purchaseListItemModelSerializer.fromMap(modelMap);
    });

    return itemModelsList.toList();
  }
}
