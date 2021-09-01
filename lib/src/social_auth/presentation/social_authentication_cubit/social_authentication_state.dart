part of 'social_authentication_cubit.dart';

abstract class SocialAuthenticationState extends Equatable {
  const SocialAuthenticationState();

  @override
  List<Object> get props => [];
}

class SocialAuthenticationInitial extends SocialAuthenticationState {
  const SocialAuthenticationInitial();
}

class SocialAuthenticationSuccessful extends SocialAuthenticationState {
  const SocialAuthenticationSuccessful();
}

class SocialAuthenticationServerFailed extends SocialAuthenticationState {
  const SocialAuthenticationServerFailed();
}

class SocialAuthenticationConnectionFailed extends SocialAuthenticationState {
  const SocialAuthenticationConnectionFailed();
}
