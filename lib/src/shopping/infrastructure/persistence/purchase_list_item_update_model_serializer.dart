import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class PurchaseListItemUpdateModelSerializer {
  Map<String, dynamic> toMap(PurchaseListItemUpdateModel model) {
    return {
      'is_bought': model.isBought,
    };
  }
}
