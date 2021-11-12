import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class ShoppingListCreateModelSerializer {
  Map<String, dynamic> toMap(ShoppingListCreateModel model) {
    return {'name': model.name};
  }
}
