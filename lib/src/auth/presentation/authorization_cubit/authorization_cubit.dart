import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/auth/application/application.dart';

part 'authorization_state.dart';

@injectable
class AuthorizationCubit extends Cubit<AuthorizationState> {
  final GetAuthorizationCredentialsUsecase _getAuthorizationCredentialsUsecase;
  final SignOutUsecase _signOutUsecase;

  AuthorizationCubit(
    this._getAuthorizationCredentialsUsecase,
    this._signOutUsecase,
  ) : super(AuthorizationInitial());

  Future<void> checkAuthorizationStatus() async {
    final result = await _getAuthorizationCredentialsUsecase();
    if (result.isFailure) {
      emit(AuthorizationFailed());
      return;
    }
    emit(AuthorizationSuccessful());
  }

  Future<void> signOut() async {
    await _signOutUsecase();
    emit(SignOutSuccessful());
  }
}
