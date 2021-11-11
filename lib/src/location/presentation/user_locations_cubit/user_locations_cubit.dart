import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/location/application/application.dart';
import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

part 'user_locations_state.dart';

@injectable
class UserLocationsCubit extends Cubit<UserLocationsState> {
  final GetUserLocationsUsecase _getUserLocationsUsecase;
  final EnableUserLocationUsecase _enableUserLocationUsecase;

  UserLocationsCubit(
    this._getUserLocationsUsecase,
    this._enableUserLocationUsecase,
  ) : super(UserLocationsInitial());

  Future<void> get() async {
    emit(UserLocationsLoading());
    final result = await _getUserLocationsUsecase();
    if (result.isFailure) {
      final failure = result.failure;
      emit(UserLocationsLoadFailed(failure));
      return;
    }
    final locations = result.success;
    emit(UserLocationsLoaded(locations));
  }

  Future<void> enable({required UserLocation userLocation}) async {
    if (state is! UserLocationsLoaded || userLocation.enabled) return;
    final fallback = state;
    final optimisticallyUpdatedLocations = _replaceLocationOnState(
      userLocation.enable(),
    );
    emit(UserLocationsLoaded(optimisticallyUpdatedLocations));
    final result = await _enableUserLocationUsecase(userLocation: userLocation);
    if (result.isFailure) {
      final failure = result.failure;
      emit(UserLocationsUpdateFailed(failure));
      emit(fallback);
      return;
    }
    final location = result.success;
    final newLocations = _replaceLocationOnState(location);
    emit(UserLocationsLoaded(newLocations));
  }

  List<UserLocation> _replaceLocationOnState(UserLocation userLocation) {
    final currentLocations = (state as UserLocationsLoaded).locations;
    final updatedLocations = currentLocations.map((location) {
      if (location.id == userLocation.id) return userLocation;
      return location.disable();
    }).toList();
    return updatedLocations;
  }
}
