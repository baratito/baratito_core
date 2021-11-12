import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/models/purchase_list_item_model.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

class PurchaseListItemEstablishmentModel
    extends EntityModel<PurchaseListItemEstablishment> {
  final EstablishmentModel establishment;
  final List<PurchaseListItemModel> items;

  PurchaseListItemEstablishmentModel({
    required int id,
    required this.establishment,
    required this.items,
  }) : super(id);

  @override
  PurchaseListItemEstablishment toEntity() {
    return PurchaseListItemEstablishment(
      id: id,
      establishment: establishment.toEntity(),
      items: items.map<PurchaseListItem>((model) => model.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [...super.props, establishment, items];
}
