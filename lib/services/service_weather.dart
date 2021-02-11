import 'package:dome/models/location.dart';
import 'package:dome/models/weather_data.dart';
import 'package:dome/services/api/weather_api.dart';

class WeatherService {
  //*******************************************************************************
  //  MEMBER(S)
  //
  //******************************************************************************* */
  final WeatherApi weatherApi;

  //*******************************************************************************
  //  CONSTRUCTOR(S)
  //
  //******************************************************************************* */
  WeatherService(this.weatherApi);

  //*******************************************************************************
  //  METHOD(S)
  //
  //******************************************************************************* */
  /* Future<WeatherData> getWeather(String city) async {
    final Location location = await weatherApi.getLocation(city);
    return await weatherApi.getWeatherData(location);
  }*/
}
