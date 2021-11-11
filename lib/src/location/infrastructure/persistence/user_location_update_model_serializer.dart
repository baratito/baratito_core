import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/location/application/application.dart';

@lazySingleton
class UserLocationUpdateModelSerializer {
  Map<String, dynamic> toMap(UserLocationUpdateModel model) {
    return {'enable': model.enabled};
  }
}
