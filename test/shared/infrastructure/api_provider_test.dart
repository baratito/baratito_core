import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockApiClient mockApiClient;
  late ApiProviderBaseUrl apiProviderBaseUrl;
  late FakeApiProviderEndpoint fakeApiProviderEndpoint;
  late FakeApiAuthService fakeApiAuthService;
  late MockModelSerializer mockModelSerializer;
  late ApiProvider<FakeModel> apiProvider;

  setUp(() {
    mockApiClient = MockApiClient();
    apiProviderBaseUrl = ApiProviderBaseUrl();
    fakeApiProviderEndpoint = FakeApiProviderEndpoint();
    fakeApiAuthService = FakeApiAuthService();
    mockModelSerializer = MockModelSerializer();
    apiProvider = ApiProvider(
      mockApiClient,
      apiProviderBaseUrl,
      fakeApiProviderEndpoint,
      fakeApiAuthService,
      mockModelSerializer,
    );
  });

  const token = 'token';
  const headers = {'Authorization': 'Bearer $token'};

  test('getById() returns expected model', () async {
    final modelId = 'model-id';
    final uri = Uri.parse(
      'https://api.baratito.app/api/test/$modelId/',
    );
    final serializedModel = {'id': modelId};
    final expectedModel = FakeModel(id: modelId);

    when(() => mockApiClient.buildAuthorizationHeaders(token)).thenReturn(
      headers,
    );
    when(() => mockApiClient.get(uri, headers: headers)).thenAnswer((_) async {
      return serializedModel;
    });
    when(() => mockModelSerializer.fromMap(serializedModel)).thenAnswer((_) {
      return expectedModel;
    });

    final model = await apiProvider.getById(modelId);

    verify(() => mockApiClient.buildAuthorizationHeaders(token)).called(1);
    verify(() => mockApiClient.get(uri, headers: headers)).called(1);
    verify(() => mockModelSerializer.fromMap(serializedModel)).called(1);
    expect(model, expectedModel);
  });
}

class MockApiClient extends Mock implements ApiClient {}

class FakeApiProviderEndpoint extends Fake implements ApiProviderEndpoint {
  @override
  String get endpoint => 'test/';
}

class FakeApiAuthService extends Fake implements ApiAuthorizationService {
  @override
  Future<String> getToken() async => 'token';
}

class FakeModel extends Fake implements Model {
  @override
  final String id;

  FakeModel({required this.id});
}

class MockModelSerializer extends Mock implements ModelSerializer<FakeModel> {}
