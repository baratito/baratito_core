import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class ShoppingListUpdateModelSerializer {
  Map<String, dynamic> toMap(ShoppingListUpdateModel model) {
    return {'name': model.name};
  }
}
