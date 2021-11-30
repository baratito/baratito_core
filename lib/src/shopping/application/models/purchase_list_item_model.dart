import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

class PurchaseListItemModel extends EntityModel<PurchaseListItem> {
  final String name;
  final double price;
  final int quantity;
  final bool isBought;

  PurchaseListItemModel({
    required int id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isBought,
  }) : super(id);

  @override
  PurchaseListItem toEntity() {
    return PurchaseListItem(
      id: id,
      name: name,
      price: price,
      quantity: quantity,
      isBought: isBought,
    );
  }

  @override
  List<Object?> get props {
    return [
      ...super.props,
      name,
      price,
      quantity,
      isBought,
    ];
  }
}
