import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/profiles/application/application.dart';
import 'package:baratito_core/src/profiles/infrastructure/persistence/persistence.dart';
import 'package:baratito_core/src/shared/shared.dart';

@LazySingleton(as: ProfilesRepository)
class ProfilesRepositoryImpl implements ProfilesRepository {
  final RemoteProfilesProvider _remoteProfilesProvider;

  ProfilesRepositoryImpl(this._remoteProfilesProvider);

  @override
  Future<Result<ProfileModel, ApplicationFailure>>
      getAuthenticatedUserProfile() async {
    try {
      final profileModel =
          await _remoteProfilesProvider.getAuthenticatedUserProfile();
      return Success(profileModel);
    } on Exception catch (exception) {
      final failure = _parseException(exception);
      return Failure(failure);
    }
  }

  ApplicationFailure _parseException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure();
    } else if (exception is ConnectionException) {
      return ConnectionFailure();
    } else if (exception is NotFoundException) {
      return NotFoundFailure();
    }

    throw Exception('Unexpected exception');
  }
}
