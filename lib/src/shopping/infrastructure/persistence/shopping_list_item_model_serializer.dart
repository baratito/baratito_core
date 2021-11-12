import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class ShoppingListItemModelSerializer {
  final ProductModelSerializer _productModelSerializer;

  ShoppingListItemModelSerializer(this._productModelSerializer);

  ShoppingListItemModel fromMap(Map<String, dynamic> map) {
    return ShoppingListItemModel(
      id: Optional.ofNullable(map['id']),
      product: _productModelSerializer.fromMap(map['product']),
      quantity: map['quantity'],
    );
  }
}
