import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/profiles/application/application.dart';

@lazySingleton
class ProfileModelSerializer {
  ProfileModel fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      avatarUrl: map['avatar'],
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
    );
  }
}
