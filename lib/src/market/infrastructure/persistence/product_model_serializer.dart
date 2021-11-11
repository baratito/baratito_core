import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/market/application/application.dart';

@lazySingleton
class ProductModelSerializer {
  ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      brand: map['brand'],
      category: _categoryFromInt(map['category']),
      imageUrl: map['photo'],
      name: map['name'],
      presentation: map['presentation'],
    );
  }

  Category _categoryFromInt(int? value) {
    if (value == null) return Category.none;
    return Category.values[value];
  }
}
