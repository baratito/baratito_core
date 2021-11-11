part of 'map_locations_search_cubit.dart';

abstract class MapLocationsSearchState extends Equatable {
  const MapLocationsSearchState();

  @override
  List<Object> get props => [];
}

class MapLocationsSearchInitial extends MapLocationsSearchState {
  const MapLocationsSearchInitial();
}

class MapLocationsSearchLoading extends MapLocationsSearchState {
  const MapLocationsSearchLoading();
}

class MapLocationsSearchNoResults extends MapLocationsSearchState {
  const MapLocationsSearchNoResults();
}

class MapLocationsSearchResultsFound extends MapLocationsSearchState {
  final List<MapLocation> mapLocations;

  const MapLocationsSearchResultsFound(this.mapLocations);

  @override
  List<Object> get props => [...super.props, mapLocations];
}
