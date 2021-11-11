import 'package:baratito_core/src/market/domain/establishment.dart';
import 'package:baratito_core/src/market/domain/product.dart';
import 'package:baratito_core/src/shared/shared.dart';

class Price extends Entity {
  final Product product;
  final Establishment establishment;
  final double value;

  Price({
    required int id,
    required this.product,
    required this.establishment,
    required this.value,
  }) : super(id);

  @override
  List<Object?> get props => [...super.props, product, establishment, value];
}
