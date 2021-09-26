import 'package:baratito_core/src/profiles/application/application.dart';

abstract class RemoteProfilesProvider {
  Future<ProfileModel> getAuthenticatedUserProfile();
}
