import 'package:baratito_core/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/profiles/profiles.dart';

void main() {
  late MockApiClient mockApiClient;
  late MockApiAuthorizationService mockApiAuthorizationService;
  late ProfileModelSerializer profileModelSerializer;
  late ApiProfilesProvider apiProfilesProvider;

  setUp(() {
    mockApiClient = MockApiClient();
    mockApiAuthorizationService = MockApiAuthorizationService();
    profileModelSerializer = ProfileModelSerializer();
    apiProfilesProvider = ApiProfilesProvider(
      mockApiClient,
      mockApiAuthorizationService,
      profileModelSerializer,
    );
  });

  final token = 'token';
  final headers = {'Authorization': 'Bearer $token'};
  final endpoint = 'https://api.baratito.app/api/profile/';
  final uri = Uri.parse(endpoint);

  final profileMap = {
    'id': 'id',
    'email': 'email',
    'first_name': 'first-name',
    'last_name': 'last-name',
    'avatar_url': 'avatar-url',
  };
  final profileModel = ProfileModel(
    id: 1,
    email: 'email',
    firstName: 'first-name',
    lastName: 'last-name',
    avatarUrl: 'avatar-url',
  );

  test('returns ProfileModel on a successful call', () async {
    when(() => mockApiAuthorizationService.getToken()).thenAnswer((_) async {
      return token;
    });
    when(() => mockApiClient.get(uri, headers: headers)).thenAnswer((_) async {
      return profileMap;
    });
    when(() => profileModelSerializer.fromMap(profileMap)).thenReturn(
      profileModel,
    );

    final result = await apiProfilesProvider.getAuthenticatedUserProfile();

    verify(() => mockApiAuthorizationService.getToken()).called(1);
    verify(() => mockApiClient.get(uri, headers: headers)).called(1);
    verify(() => profileModelSerializer.fromMap(profileMap)).called(1);

    expect(result, profileModel);
  });
}

class MockApiClient extends Mock implements ApiClient {}

class MockApiAuthorizationService extends Mock
    implements ApiAuthorizationService {}

class ProfileModelSerializer extends Mock
    implements ModelSerializer<ProfileModel> {}
