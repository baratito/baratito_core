import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/purchase_list_item.dart';

class PurchaseListItemEstablishment extends Entity {
  final Establishment establishment;
  final List<PurchaseListItem> items;

  PurchaseListItemEstablishment({
    required int id,
    required this.establishment,
    required this.items,
  }) : super(id);

  PurchaseListItemEstablishment copyWith({
    Establishment? establishment,
    List<PurchaseListItem>? items,
  }) {
    return PurchaseListItemEstablishment(
      id: id,
      establishment: establishment ?? this.establishment,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [...super.props, establishment, items];
}
