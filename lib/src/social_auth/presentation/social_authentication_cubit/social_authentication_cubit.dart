import 'package:baratito_core/src/shared/shared.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/social_auth/application/application.dart';
import 'package:baratito_core/src/social_auth/domain/domain.dart';

part 'social_authentication_state.dart';

@injectable
class SocialAuthenticationCubit extends Cubit<SocialAuthenticationState> {
  final SocialAuthenticateUsecase _socialAuthenticateUsecase;

  SocialAuthenticationCubit(
    this._socialAuthenticateUsecase,
  ) : super(SocialAuthenticationInitial());

  Future<void> authenticate(SocialAuthenticationCredentials credentials) async {
    final result = await _socialAuthenticateUsecase(credentials: credentials);
    if (result.isFailure) return _emitFailedState(result.failure);
    emit(SocialAuthenticationSuccessful());
  }

  void _emitFailedState(ApplicationFailure failure) {
    if (failure is ConnectionFailure) {
      emit(SocialAuthenticationConnectionFailed());
    } else if (failure is ServerFailure) {
      emit(SocialAuthenticationServerFailed());
    }
  }
}
