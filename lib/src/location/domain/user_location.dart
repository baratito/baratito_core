import 'package:baratito_core/src/shared/shared.dart';
import 'package:optional/optional.dart';

class UserLocation extends Entity {
  final String name;
  final String address;
  final LatLong location;
  final bool enabled;
  final Optional<String> city;
  final Optional<String> country;

  const UserLocation({
    required int id,
    required this.name,
    required this.city,
    required this.country,
    required this.address,
    required this.location,
    required this.enabled,
  }) : super(id);

  UserLocation copyWith({
    String? name,
    String? address,
    LatLong? location,
    bool? enabled,
    Optional<String>? city,
    Optional<String>? country,
  }) {
    return UserLocation(
      id: id,
      name: name ?? this.name,
      address: address ?? this.address,
      location: location ?? this.location,
      enabled: enabled ?? this.enabled,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  UserLocation enable() => copyWith(enabled: true);

  UserLocation disable() => copyWith(enabled: false);

  @override
  List<Object?> get props {
    return [
      ...super.props,
      name,
      address,
      location,
      enabled,
      city,
      country,
    ];
  }
}
