import 'package:equatable/equatable.dart';

class LatLong extends Equatable {
  final double latitude;
  final double longitude;

  LatLong(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}
