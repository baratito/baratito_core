import 'package:baratito_core/src/shared/shared.dart';

class Profile extends Entity {
  final String avatarUrl;
  final String firstName;
  final String lastName;
  final String email;

  const Profile({
    required int id,
    required this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(id);

  @override
  List<Object?> get props {
    return [
      ...super.props,
      avatarUrl,
      firstName,
      lastName,
      email,
    ];
  }
}
