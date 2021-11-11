import 'package:optional/optional.dart';

import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

class UserLocationModel extends EntityModel {
  final String name;
  final String address;
  final LatLong location;
  final bool enabled;
  final Optional<String> city;
  final Optional<String> country;

  UserLocationModel({
    required int id,
    required this.name,
    required this.city,
    required this.country,
    required this.address,
    required this.location,
    required this.enabled,
  }) : super(id);

  @override
  UserLocation toEntity() {
    return UserLocation(
      id: id,
      name: name,
      address: address,
      location: location,
      enabled: enabled,
      city: city,
      country: country,
    );
  }
}
