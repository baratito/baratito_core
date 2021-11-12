import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

class ShoppingListItemModel extends Equatable {
  final Optional<int> id;
  final ProductModel product;
  final int quantity;

  ShoppingListItemModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  ShoppingListItem toEntity() {
    return ShoppingListItem(
      id: id,
      product: product.toEntity(),
      quantity: quantity,
    );
  }

  @override
  List<Object?> get props => [id, product, quantity];
}
