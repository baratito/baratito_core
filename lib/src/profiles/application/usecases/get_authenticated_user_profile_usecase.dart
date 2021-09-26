import 'package:baratito_core/baratito_core.dart';
import 'package:injectable/injectable.dart';
import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/profiles/application/repositories/repositories.dart';
import 'package:baratito_core/src/profiles/domain/domain.dart';

@lazySingleton
class GetAuthenticatedUserProfileUsecase {
  final ProfilesRepository _profilesRepository;

  GetAuthenticatedUserProfileUsecase(this._profilesRepository);

  Future<Result<Profile, ApplicationFailure>> call() async {
    final result = await _profilesRepository.getAuthenticatedUserProfile();
    
    if (result.isFailure) return Failure(result.failure);
    
    final profileModel = result.success;
    final profile = profileModel.toEntity();
    return Success(profile);
  }
}
