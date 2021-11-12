import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

class PurchaseListItemModel extends EntityModel<PurchaseListItem> {
  final String name;
  final double price;
  final int quantity;

  PurchaseListItemModel({
    required int id,
    required this.name,
    required this.price,
    required this.quantity,
  }) : super(id);

  @override
  PurchaseListItem toEntity() {
    return PurchaseListItem(
      id: id,
      name: name,
      price: price,
      quantity: quantity,
    );
  }

  @override
  List<Object?> get props => [...super.props, name, price, quantity];
}
