import 'package:baratito_core/src/shared/domain/latlong.dart';
import 'package:equatable/equatable.dart';

class LatLongBoundaries extends Equatable {
  final LatLong southwest;
  final LatLong northeast;

  LatLongBoundaries({required this.southwest, required this.northeast});

  @override
  List<Object?> get props => [southwest, northeast];
}
