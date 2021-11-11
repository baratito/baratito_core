import 'package:baratito_core/src/shared/shared.dart';

class Establishment extends Entity {
  final String name;
  final String brand;
  final String address;
  final LatLong location;

  Establishment({
    required int id,
    required this.name,
    required this.brand,
    required this.address,
    required this.location,
  }) : super(id);

  @override
  List<Object?> get props => [...super.props, name, brand, address, location];
}
