import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/establishment_model_serializer.dart';
import 'package:baratito_core/src/market/infrastructure/persistence/product_model_serializer.dart';

@lazySingleton
class PriceModelSerializer {
  final ProductModelSerializer _productModelSerializer;
  final EstablishmentModelSerializer _establishmentModelSerializer;

  PriceModelSerializer(
    this._productModelSerializer,
    this._establishmentModelSerializer,
  );

  PriceModel fromMap(Map<String, dynamic> map) {
    return PriceModel(
      id: map['id'],
      value: _priceFromMap(map),
      product: _productModelSerializer.fromMap(map['product']),
      establishment: _establishmentModelSerializer.fromMap(
        map['establishment'],
      ),
    );
  }

  double _priceFromMap(Map<String, dynamic> map) {
    final price = map['price'];
    if (price is int) {
      return price.toDouble();
    }
    return price;
  }
}
