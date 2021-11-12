import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class ShoppingListItemUpdateModelSerializer {
  Map<String, dynamic> toMap(ShoppingListItemUpdateModel model) {
    return {
      if (model.id.isPresent) 'id': model.id.value,
      'product_id': model.product.id,
      'quantity': model.quantity,
    };
  }
}
