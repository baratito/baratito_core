import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

part 'map_locations_search_state.dart';

@injectable
class MapLocationsSearchCubit extends Cubit<MapLocationsSearchState> {
  final GoogleMapsPlaces googlePlacesService;

  MapLocationsSearchCubit(
    this.googlePlacesService,
  ) : super(MapLocationsSearchInitial());

  Future<void> search({required String query}) async {
    if (query.isEmpty) {
      emit(MapLocationsSearchNoResults());
      return;
    }
    emit(MapLocationsSearchLoading());
    final placesResponse = await googlePlacesService.autocomplete(
      query,
      components: [Component('country', 'ar')],
      types: ['address'],
    );
    final results = placesResponse.predictions;
    if (results.isEmpty) emit(MapLocationsSearchNoResults());
    final mapLocations = await Future.wait(
      results.map(_mapLocationFromPlacesPredeiction).toList(),
    );
    emit(MapLocationsSearchResultsFound(mapLocations));
  }

  Future<MapLocation> _mapLocationFromPlacesPredeiction(
      Prediction prediction) async {
    final response = await googlePlacesService.getDetailsByPlaceId(
      prediction.placeId!,
    );
    final details = response.result;
    final location = details.geometry!.location;
    return MapLocation(
      name: details.name,
      address: details.formattedAddress ?? '',
      location: LatLong(location.lat, location.lng),
      country: Optional.ofNullable(_countryFromPlaceDetails(details)),
      city: Optional.ofNullable(_cityFromPlaceDetails(details)),
    );
  }

  String? _countryFromPlaceDetails(PlaceDetails details) {
    final components = details.addressComponents;
    final countriesList = components.where((component) {
      return component.types.any((element) => element == 'country');
    });
    if (countriesList.isEmpty) return null;
    return countriesList.first.longName;
  }

  String? _cityFromPlaceDetails(PlaceDetails details) {
    final components = details.addressComponents;
    final citiesList = components.where((component) {
      return component.types.any((element) => element == 'locality');
    });
    if (citiesList.isEmpty) return null;
    return citiesList.first.longName;
  }
}
