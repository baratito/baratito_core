import 'package:google_maps_webservice/places.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoogleMapsPlacesModule {
  final _instance = GoogleMapsPlaces(
    apiKey: const String.fromEnvironment('MAPS_API_KEY'),
  );

  @lazySingleton
  GoogleMapsPlaces get googleMapsPlaces {
    return _instance;
  }
}
