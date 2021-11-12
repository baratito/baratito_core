import 'package:baratito_core/src/market/market.dart';
import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

class ShoppingListItem extends Equatable {
  final Optional<int> id;
  final Product product;
  final int quantity;

  ShoppingListItem({
    required this.id,
    required this.product,
    required this.quantity,
  });

  ShoppingListItem copyWith({
    Optional<int>? id,
    Product? product,
    int? quantity,
  }) {
    return ShoppingListItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  ShoppingListItem changeQuantity(int newQuantity) {
    return copyWith(quantity: newQuantity);
  }

  @override
  List<Object?> get props => [id, product, quantity];
}
