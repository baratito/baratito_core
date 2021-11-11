import 'package:baratito_core/src/location/application/application.dart';

abstract class RemoteUserLocationsProvider {
  Future<List<UserLocationModel>> getAll();
  Future<UserLocationModel> create(UserLocationCreateModel model);
  Future<UserLocationModel> enable(UserLocationUpdateModel model);
}
