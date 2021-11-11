part of 'user_location_create_cubit.dart';

abstract class UserLocationCreateState extends Equatable {
  const UserLocationCreateState();

  @override
  List<Object> get props => [];
}

class UserLocationCreateInitial extends UserLocationCreateState {
  const UserLocationCreateInitial();
}

abstract class UserLocationCreateData extends UserLocationCreateState {
  final MapLocation mapLocation;

  const UserLocationCreateData(this.mapLocation);

  @override
  List<Object> get props => [...super.props, mapLocation];
}

class UserLocationCreateLoaded extends UserLocationCreateData {
  const UserLocationCreateLoaded({required MapLocation mapLocation})
      : super(mapLocation);
}

class UserLocationCreateLoading extends UserLocationCreateData {
  const UserLocationCreateLoading({required MapLocation mapLocation})
      : super(mapLocation);
}

class UserLocationCreateSuccess extends UserLocationCreateState {
  const UserLocationCreateSuccess();
}

class UserLocationCreateFailed extends UserLocationCreateState {
  final ApplicationFailure failure;

  const UserLocationCreateFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
