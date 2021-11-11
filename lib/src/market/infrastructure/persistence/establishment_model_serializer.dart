import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/market/application/application.dart';

@lazySingleton
class EstablishmentModelSerializer {
  EstablishmentModel fromMap(Map<String, dynamic> map) {
    return EstablishmentModel(
      id: map['id'],
      brand: map['brand'],
      name: map['name'],
      address: map['address'],
      location: _latLongFromRemoteMap(map),
    );
  }

  LatLong _latLongFromRemoteMap(Map<String, dynamic> map) {
    return LatLong(map['latitude'] as double, map['longitude'] as double);
  }
}
