import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/location/application/application.dart';

@lazySingleton
class UserLocationCreateModelSerializer {
  Map<String, dynamic> toMap(UserLocationCreateModel model) {
    return {
      'name': model.name,
      'address': model.address,
      'longitude': model.location.longitude,
      'latitude': model.location.latitude,
      'enable': model.enabled,
      if (model.country.isNotEmpty) 'country': model.country.value,
      if (model.city.isNotEmpty) 'city': model.city.value,
    };
  }
}
