part of 'authorization_cubit.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitial extends AuthorizationState {
  const AuthorizationInitial();
}

class AuthorizationSuccessful extends AuthorizationState {
  const AuthorizationSuccessful();
}

class AuthorizationFailed extends AuthorizationState {
  const AuthorizationFailed();
}

class SignOutSuccessful extends AuthorizationState {
  const SignOutSuccessful();
}
