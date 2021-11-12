import 'package:flutter/painting.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';

@lazySingleton
class ShoppingListModelSerializer {
  ShoppingListModel fromMap(Map<String, dynamic> map) {
    return ShoppingListModel(
      id: map['id'],
      name: map['name'],
      color: _colorFromString(map['color']),
    );
  }

  Color _colorFromString(String hexString) {
    final value = int.parse(hexString, radix: 16) + 0xFF000000;
    return Color(value);
  }
}
