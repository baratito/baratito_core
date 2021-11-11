import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/location/application/application.dart';
import 'package:baratito_core/src/shared/shared.dart';

@lazySingleton
class UserLocationModelSerializer {
  UserLocationModel fromMap(Map<String, dynamic> map) {
    return UserLocationModel(
      id: map['id'],
      address: map['address'],
      city: Optional.ofNullable(map['city']),
      country: Optional.ofNullable(map['country']),
      enabled: map['enable'],
      location: _latLongFromRemoteMap(map),
      name: map['name'],
    );
  }

  LatLong _latLongFromRemoteMap(Map<String, dynamic> map) {
    return LatLong(map['latitude'] as double, map['longitude'] as double);
  }
}
