import 'package:baratito_core/src/profiles/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

class ProfileModel extends Model<Profile> {
  final String avatarUrl;
  final String firstName;
  final String lastName;
  final String email;

  const ProfileModel({
    required int id,
    required this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(id);

  factory ProfileModel.fromEntity(Profile profile) {
    return ProfileModel(
      id: profile.id,
      avatarUrl: profile.avatarUrl,
      firstName: profile.firstName,
      lastName: profile.lastName,
      email: profile.email,
    );
  }

  @override
  Profile toEntity() {
    return Profile(
      id: id,
      avatarUrl: avatarUrl,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
