import 'package:adviser/infrastructure/datasources/adviser_remote_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:adviser/infrastructure/models/advise_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'adviser_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late AdviserRemoteDatasource adviserRemoteDatasource;
  late MockClient mockClient;
  final Uri uri = Uri.parse('https://api.adviceslip.com/advice');
  const Map<String, String> headers = {'Content-Type': 'application/json'};

  setUp(() {
    mockClient = MockClient();
    adviserRemoteDatasource = AdviserRemoteDatasourceImpl(client: mockClient);
  });

  // helper functions
  void setUpMockClientSuccess200() {
    // arrange
    when(mockClient.get(any, headers: anyNamed("headers")))
        .thenAnswer((_) async => http.Response(fixture('advise.json'), 200));
  }

  void setUpMockClientFailure500() {
    // arrange
    when(mockClient.get(any, headers: anyNamed("headers")))
        .thenAnswer((_) async => http.Response(fixture('advise.json'), 500));
  }

  group('get', () {
    final testAdviseModel = AdviseModel(advise: 'Test', id: 1);

    test(
        'Check if GET request is sent to "https://api.adviceslip.com/advice", and Content-Type is "application/json"',
        () {
      // arrange
      setUpMockClientSuccess200();

      // act
      adviserRemoteDatasource.get();

      // assert
      verify(mockClient.get(uri, headers: headers));
    });

    test('Get advise when the status code is 200', () async {
      // arrange
      setUpMockClientSuccess200();

      // act
      final res = await adviserRemoteDatasource.get();

      // assert
      expect(res, testAdviseModel);
    });

    test('Throw server exception if status code is not 200', () {
      // arrange
      setUpMockClientFailure500();

      // act
      //save function in a variable
      final call = adviserRemoteDatasource.get;

      // assert
      // execute the function in the expect()
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
