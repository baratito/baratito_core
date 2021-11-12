import 'package:baratito_core/src/shared/shared.dart';

class PurchaseListItem extends Entity {
  final String name;
  final double price;
  final int quantity;

  PurchaseListItem({
    required int id,
    required this.name,
    required this.price,
    required this.quantity,
  }) : super(id);

  @override
  List<Object?> get props => [...super.props, name, price, quantity];
}
