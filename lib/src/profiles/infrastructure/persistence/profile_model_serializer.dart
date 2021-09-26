import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/profiles/application/application.dart';
import 'package:baratito_core/src/shared/shared.dart';

typedef ProfileModelSerializerAlias = ModelSerializer<ProfileModel>;

@LazySingleton(as: ProfileModelSerializerAlias)
class ProfileModelSerializer implements ModelSerializer<ProfileModel> {
  @override
  ProfileModel fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      avatarUrl: map['avatar'],
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
    );
  }

  @override
  Map<String, dynamic> toMap(ProfileModel model) {
    return {
      'id': model.id,
      'avatar': model.avatarUrl,
      'email': model.email,
      'first_name': model.firstName,
      'last_name': model.lastName,
    };
  }
}
