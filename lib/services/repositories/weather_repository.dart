import 'package:dome/models/location.dart';
import 'package:dome/models/weather_data.dart';
import 'package:dome/services/api/weather_api.dart';

class WeatherRepository {
  final OpenWeatherMapApiProvider _weatherProvider =
      OpenWeatherMapApiProvider();

  Future<Location> getLocation(String city) =>
      _weatherProvider.getLocation(city);

  Future<WeatherData> getWeather(String location) =>
      _weatherProvider.getWeatherData(location);
}
