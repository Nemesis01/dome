import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dome/models/location.dart';
import 'package:dome/models/weather_data.dart';
import 'package:dome/utils/strings.dart';
import 'package:http/http.dart';

abstract class WeatherApi {
  Future<WeatherData> getWeatherData(String location);
  Future<Location> getLocation(String city);
}

class OpenWeatherMapApiProvider extends WeatherApi {
  //
  static const String endPointUrl = OPEN_WEATHER_MAP_API_URL;
  static const String apiKey = OPEN_WEATHER_MAP_API_KEY;
  http.Client httpClient;

  /// Class Constructor.
  ///
  /// Initialises [httpClient] Http Client.
  OpenWeatherMapApiProvider() {
    this.httpClient = http.Client();
  }

  //*********************************************************************************
  //
  //
  //
  //*********************************************************************************

  /// Tries to retrieve a location from the api for the given [city].
  ///
  /// Returns a Location object otherwise
  /// An Exception if an error occurs during the process.
  @override
  Future<Location> getLocation(String city) async {
    final String requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';
    final Response response =
        await this.httpClient.get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'An error occurs when retrieving location for city $city : ${response.statusCode}');
    }
    return Location.fromJson(jsonDecode(response.body));
  }

  @override
  Future<WeatherData> getWeatherData(String city) async {
    final String requestUrl =
        '$endPointUrl/weather?q=$city&units=metric&APPID=$apiKey';
    final Response response =
        await this.httpClient.get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'An error occurs when retrieving location for city $city : ${response.statusCode}');
    }
    return WeatherData.fromJson(jsonDecode(response.body));
  }
}
