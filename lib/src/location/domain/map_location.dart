import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/shared/shared.dart';

class MapLocation extends Equatable {
  final String name;
  final String address;
  final LatLong location;
  final Optional<String> city;
  final Optional<String> country;

  const MapLocation({
    required this.name,
    required this.address,
    required this.location,
    this.city = const Optional.empty(),
    this.country = const Optional.empty(),
  });

  MapLocation copyWith({
    String? name,
    String? address,
    LatLong? location,
    Optional<String>? city,
    Optional<String>? country,
  }) {
    return MapLocation(
      name: name ?? this.name,
      address: address ?? this.address,
      location: location ?? this.location,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  MapLocation changeName(String newName) {
    return copyWith(name: newName);
  }

  @override
  List<Object?> get props {
    return [
      name,
      address,
      location,
      city,
      country,
    ];
  }
}
