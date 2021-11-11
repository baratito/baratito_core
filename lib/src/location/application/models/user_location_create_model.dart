import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/shared/shared.dart';

class UserLocationCreateModel extends Equatable {
  final String name;
  final String address;
  final LatLong location;
  final bool enabled;
  final Optional<String> city;
  final Optional<String> country;

  UserLocationCreateModel({
    required this.name,
    required this.address,
    required this.location,
    required this.enabled,
    this.city = const Optional.empty(),
    this.country = const Optional.empty(),
  });

  @override
  List<Object> get props {
    return [
      name,
      address,
      location,
      enabled,
      city,
      country,
    ];
  }
}
