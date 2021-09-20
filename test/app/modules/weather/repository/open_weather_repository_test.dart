import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../lib/app/modules/weather/model/city_weather_model.dart';
import '../../../../../lib/app/modules/weather/repository/open_weather_repository.dart';
import 'open_weather_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  IOpenWeatherRepository api = OpenWeatherRepositoryHttp(client);
  test('open weather api return Melbourne', () async {
    when(client.get(any))
        .thenAnswer((_) async => http.Response(mockCityWeather, 200));

    final list = await api.getWeatherByCityName('');

    expect(list.name, equals('Melbourne'));
  });
}
