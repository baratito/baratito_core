import 'package:baratito_core/src/shared/shared.dart';

class PurchaseListItem extends Entity {
  final String name;
  final double price;
  final int quantity;
  final bool isBought;

  PurchaseListItem({
    required int id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isBought,
  }) : super(id);

  PurchaseListItem copyWith({
    String? name,
    double? price,
    int? quantity,
    bool? isBought,
  }) {
    return PurchaseListItem(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isBought: isBought ?? this.isBought,
    );
  }

  PurchaseListItem toggleBoughtState() {
    return copyWith(isBought: !isBought);
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
