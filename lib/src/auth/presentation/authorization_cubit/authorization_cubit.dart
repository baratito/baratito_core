import 'package:baratito_core/src/auth/application/application.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authorization_state.dart';

@injectable
class AuthorizationCubit extends Cubit<AuthorizationState> {
  final GetAuthorizationCredentialsUsecase _getAuthorizationCredentialsUsecase;

  AuthorizationCubit(
    this._getAuthorizationCredentialsUsecase,
  ) : super(AuthorizationInitial());

  Future<void> checkAuthorizationStatus() async {
    final result = await _getAuthorizationCredentialsUsecase();
    if (result.isFailure) {
      emit(AuthorizationFailed());
      return;
    }
    emit(AuthorizationSuccessful());
  }
}
