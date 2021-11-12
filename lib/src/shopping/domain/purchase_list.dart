import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/purchase_list_item_establishment.dart';

enum PurchaseListStatus {
  inProgress,
  complete,
}

class PurchaseList extends Entity {
  final String name;
  final double totalDistanceInMeters;
  final Duration duration;
  final double estimatedValue;
  final PurchaseListStatus status;
  final List<PurchaseListItemEstablishment> establishments;

  PurchaseList({
    required int id,
    required this.name,
    required this.totalDistanceInMeters,
    required this.duration,
    required this.estimatedValue,
    required this.status,
    required this.establishments,
  }) : super(id);

  @override
  List<Object?> get props {
    return [
      ...super.props,
      name,
      totalDistanceInMeters,
      duration,
      estimatedValue,
      status,
      establishments,
    ];
  }
}
