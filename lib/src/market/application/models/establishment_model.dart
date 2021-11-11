import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

class EstablishmentModel extends EntityModel<Establishment> {
  final String name;
  final String brand;
  final String address;
  final LatLong location;

  EstablishmentModel({
    required int id,
    required this.name,
    required this.brand,
    required this.address,
    required this.location,
  }) : super(id);

  @override
  Establishment toEntity() {
    return Establishment(
      id: id,
      name: name,
      brand: brand,
      address: address,
      location: location,
    );
  }

  @override
  List<Object?> get props {
    return [
      ...super.props,
      name,
      brand,
      address,
      location,
    ];
  }
}
