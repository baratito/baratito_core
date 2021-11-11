import 'package:baratito_core/src/market/application/models/establishment_model.dart';
import 'package:baratito_core/src/market/application/models/product_model.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

class PriceModel extends EntityModel<Price> {
  final ProductModel product;
  final EstablishmentModel establishment;
  final double value;

  PriceModel({
    required int id,
    required this.product,
    required this.establishment,
    required this.value,
  }) : super(id);

  @override
  Price toEntity() {
    return Price(
      id: id,
      value: value,
      establishment: establishment.toEntity(),
      product: product.toEntity(),
    );
  }

  @override
  List<Object?> get props => [...super.props, product, establishment, value];
}
