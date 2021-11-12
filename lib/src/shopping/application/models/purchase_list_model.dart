import 'package:baratito_core/baratito_core.dart';

class PurchaseListModel extends EntityModel<PurchaseList> {
  final String name;
  final double totalDistanceInMeters;
  final Duration duration;
  final double estimatedValue;
  final PurchaseListStatus status;
  final List<PurchaseListItemEstablishmentModel> establishments;

  PurchaseListModel({
    required int id,
    required this.name,
    required this.totalDistanceInMeters,
    required this.duration,
    required this.estimatedValue,
    required this.status,
    required this.establishments,
  }) : super(id);

  @override
  PurchaseList toEntity() {
    return PurchaseList(
      id: id,
      name: name,
      totalDistanceInMeters: totalDistanceInMeters,
      duration: duration,
      estimatedValue: estimatedValue,
      status: status,
      establishments: establishments
          .map<PurchaseListItemEstablishment>((model) => model.toEntity())
          .toList(),
    );
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
    ];
  }
}
