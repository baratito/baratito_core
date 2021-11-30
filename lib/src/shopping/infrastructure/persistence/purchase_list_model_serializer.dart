import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/infrastructure/persistence/purchase_list_establishment_model_serializer.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class PurchaseListModelSerializer {
  final PurchaseListItemEstablishmentModelSerializer
      _establishmentModelSerializer;

  PurchaseListModelSerializer(this._establishmentModelSerializer);

  PurchaseListModel fromMap(Map<String, dynamic> map) {
    return PurchaseListModel(
      id: map['id'],
      name: map['name'],
      totalDistanceInMeters: map['distance'],
      duration: Duration(seconds: map['duration']),
      estimatedValue: map['estimated_price'],
      status: PurchaseListStatus.values[map['status']],
      establishments: _establishmentsFromMap(map),
      boundaries: _boundariesFromMap(map),
      polyline: map['overview_polyline'],
      startingPoint: _startingPointFromMap(map),
    );
  }

  List<PurchaseListItemEstablishmentModel> _establishmentsFromMap(
      Map<String, dynamic> map) {
    final establishmentJsonList = map['establishments'] as List;
    final establishmentModelsList = establishmentJsonList
        .map<PurchaseListItemEstablishmentModel>((modelMap) {
      return _establishmentModelSerializer.fromMap(modelMap);
    });

    return establishmentModelsList.toList();
  }

  LatLongBoundaries _boundariesFromMap(Map<String, dynamic> map) {
    final boundaries = map['boundaries'];
    final southwestMap = boundaries['southwest'];
    final southwest = LatLong(
      southwestMap['latitude'] as double,
      southwestMap['longitude'] as double,
    );
    final northeastMap = boundaries['northeast'];
    final northeast = LatLong(
      northeastMap['latitude'] as double,
      northeastMap['longitude'] as double,
    );
    return LatLongBoundaries(southwest: southwest, northeast: northeast);
  }

  LatLong _startingPointFromMap(Map<String, dynamic> map) {
    final location = map['starting_point'];
    return LatLong(
      location['latitude'] as double,
      location['longitude'] as double,
    );
  }
}
