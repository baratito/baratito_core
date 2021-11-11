part of 'user_locations_cubit.dart';

abstract class UserLocationsState extends Equatable {
  const UserLocationsState();

  @override
  List<Object> get props => [];
}

class UserLocationsInitial extends UserLocationsState {
  const UserLocationsInitial();
}

class UserLocationsLoading extends UserLocationsState {
  const UserLocationsLoading();
}

abstract class UserLocationsData extends UserLocationsState {
  final List<UserLocation> locations;

  const UserLocationsData(this.locations);

  UserLocation? getEnabledLocation() {
    final selected = locations.where((location) => location.enabled);
    if (selected.isEmpty) return null;
    return selected.first;
  }

  @override
  List<Object> get props => [...super.props, locations];
}

class UserLocationsLoaded extends UserLocationsData {
  const UserLocationsLoaded(List<UserLocation> locations) : super(locations);
}

class UserLocationsLoadFailed extends UserLocationsState {
  final ApplicationFailure failure;

  const UserLocationsLoadFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}

class UserLocationsUpdateFailed extends UserLocationsState {
  final ApplicationFailure failure;

  const UserLocationsUpdateFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
