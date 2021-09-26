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

class SocialAuthenticationFailed extends SocialAuthenticationState {
  final ApplicationFailure failure;

  const SocialAuthenticationFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
