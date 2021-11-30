import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class PurchaseListItemModelSerializer {
  PurchaseListItemModel fromMap(Map<String, dynamic> map) {
    return PurchaseListItemModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      isBought: map['is_bought'],
    );
  }
}
