import 'package:baratito_core/baratito_core.dart';

class PurchaseListItemUpdateModel extends Equatable {
  final int id;
  final bool isBought;

  PurchaseListItemUpdateModel({
    required this.id,
    required this.isBought,
  });

  @override
  List<Object?> get props => [id, isBought];
}
