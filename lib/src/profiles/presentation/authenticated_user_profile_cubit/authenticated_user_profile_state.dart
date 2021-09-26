part of 'authenticated_user_profile_cubit.dart';

abstract class AuthenticatedUserProfileState extends Equatable {
  const AuthenticatedUserProfileState();

  @override
  List<Object> get props => [];
}

class AuthenticatedUserProfileInitial extends AuthenticatedUserProfileState {}

class AuthenticatedUserProfileGetSuccessful
    extends AuthenticatedUserProfileState {
  final Profile profile;

  const AuthenticatedUserProfileGetSuccessful(this.profile);

  @override
  List<Object> get props => [...super.props, profile];
}

class AuthenticatedUserProfileGetFailed extends AuthenticatedUserProfileState {
  final ApplicationFailure failure;

  const AuthenticatedUserProfileGetFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
