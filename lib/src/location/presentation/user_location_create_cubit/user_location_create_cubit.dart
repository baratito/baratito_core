import 'package:baratito_core/src/location/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/location/application/application.dart';
import 'package:baratito_core/src/shared/shared.dart';

part 'user_location_create_state.dart';

@injectable
class UserLocationCreateCubit extends Cubit<UserLocationCreateState> {
  final CreateUserLocationUsecase _createUserLocationUsecase;

  UserLocationCreateCubit(this._createUserLocationUsecase)
      : super(UserLocationCreateInitial());

  MapLocation get _currentMapLocation {
    final _state = state as UserLocationCreateData;
    return _state.mapLocation;
  }

  void load({required MapLocation mapLocation}) {
    emit(UserLocationCreateLoaded(mapLocation: mapLocation));
  }

  void updateName(String name) {
    if (state is! UserLocationCreateData) return;
    final updatedMapLocation = _currentMapLocation.changeName(name);
    emit(UserLocationCreateLoaded(mapLocation: updatedMapLocation));
  }

  Future<void> create() async {
    if (state is! UserLocationCreateData) return;
    final fallbackState = state;
    emit(UserLocationCreateLoading(mapLocation: _currentMapLocation));
    final result = await _createUserLocationUsecase(
      mapLocation: _currentMapLocation,
    );
    if (result.isFailure) {
      emit(UserLocationCreateFailed(result.failure));
      emit(fallbackState);
      return;
    }
    emit(UserLocationCreateSuccess());
  }
}
