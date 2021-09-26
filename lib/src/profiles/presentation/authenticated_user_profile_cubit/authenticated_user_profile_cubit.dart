import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/profiles/application/application.dart';
import 'package:baratito_core/src/profiles/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

part 'authenticated_user_profile_state.dart';

@injectable
class AuthenticatedUserProfileCubit
    extends Cubit<AuthenticatedUserProfileState> {
  final GetAuthenticatedUserProfileUsecase _getAuthenticatedUserProfileUsecase;

  AuthenticatedUserProfileCubit(
    this._getAuthenticatedUserProfileUsecase,
  ) : super(AuthenticatedUserProfileInitial());

  void get() async {
    final result = await _getAuthenticatedUserProfileUsecase();
    if (result.isFailure) {
      final failure = result.failure;
      emit(AuthenticatedUserProfileGetFailed(failure));
      return;
    }
    final profile = result.success;
    emit(AuthenticatedUserProfileGetSuccessful(profile));
  }
}
