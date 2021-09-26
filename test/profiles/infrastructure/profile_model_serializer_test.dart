import 'package:baratito_core/src/profiles/profiles.dart';
import 'package:test/test.dart';

void main() {
  late ProfileModelSerializer profileModelSerializer;

  setUp(() {
    profileModelSerializer = ProfileModelSerializer();
  });

  final profileMap = {
    'id': 1,
    'email': 'email',
    'first_name': 'first-name',
    'last_name': 'last-name',
    'avatar': 'avatar-url',
  };
  final profileModel = ProfileModel(
    id: 1,
    email: 'email',
    firstName: 'first-name',
    lastName: 'last-name',
    avatarUrl: 'avatar-url',
  );

  test('fromMap converts properly', () {
    final result = profileModelSerializer.fromMap(profileMap);
    expect(result, profileModel);
  });

  test('toMap converts properly', () {
    final result = profileModelSerializer.toMap(profileModel);
    expect(result, profileMap);
  });
}
