import 'package:baratito_core/baratito_core.dart';

class ShoppingListItemUpdateModel extends Equatable {
  final Optional<int> id;
  final ProductModel product;
  final int quantity;

  ShoppingListItemUpdateModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, product, quantity];
}
