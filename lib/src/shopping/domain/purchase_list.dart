import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/purchase_list_item.dart';
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
  final LatLongBoundaries boundaries;
  final String polyline;
  final LatLong startingPoint;

  PurchaseList({
    required int id,
    required this.name,
    required this.totalDistanceInMeters,
    required this.duration,
    required this.estimatedValue,
    required this.status,
    required this.establishments,
    required this.boundaries,
    required this.polyline,
    required this.startingPoint,
  }) : super(id);

  PurchaseList copyWith({
    String? name,
    double? totalDistanceInMeters,
    Duration? duration,
    double? estimatedValue,
    PurchaseListStatus? status,
    List<PurchaseListItemEstablishment>? establishments,
    LatLongBoundaries? boundaries,
    String? polyline,
    LatLong? startingPoint,
  }) {
    return PurchaseList(
      id: id,
      name: name ?? this.name,
      totalDistanceInMeters:
          totalDistanceInMeters ?? this.totalDistanceInMeters,
      duration: duration ?? this.duration,
      estimatedValue: estimatedValue ?? this.estimatedValue,
      status: status ?? this.status,
      establishments: establishments ?? this.establishments,
      boundaries: boundaries ?? this.boundaries,
      polyline: polyline ?? this.polyline,
      startingPoint: startingPoint ?? this.startingPoint,
    );
  }

  PurchaseList replaceItem(PurchaseListItem item) {
    final newEstablishments = establishments.map((establishment) {
      final hasItem =
          establishment.items.where((i) => i.id == item.id).isNotEmpty;
      if (hasItem) {
        final newItems = establishment.items.map((i) {
          if (i.id == item.id) return item;
          return i;
        }).toList();
        return establishment.copyWith(items: newItems);
      }
      return establishment;
    }).toList();
    return copyWith(establishments: newEstablishments);
  }

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
      boundaries,
      polyline,
      startingPoint,
    ];
  }
}
