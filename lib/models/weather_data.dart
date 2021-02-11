import 'package:dome/utils/strings.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  unknown,
}

class WeatherData {
  //
  //
  //
  final WeatherCondition condition;
  final String description;
  final int temperature;
  final int feelsLikeTemperature;
  final int cloudiness;
  final DateTime date;
  final String iconUrl;

  //
  //
  //
  WeatherData({
    this.condition,
    this.description,
    this.temperature,
    this.feelsLikeTemperature,
    this.cloudiness,
    this.date,
    this.iconUrl,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var cloudiness = json['clouds']['all'];
    var weather = json['weather'][0];
    //var icon = json['weather']['icon'][0].toString();

    return WeatherData(
      condition: mapToWeatherConditon(weather['main'], cloudiness),
      description: AppStrings.toTitleCase(weather['description']),
      temperature: (json['main']['temp'].toDouble()).floor(),
      feelsLikeTemperature: json['main']['feels_like'].toDouble().floor(),
      cloudiness: cloudiness,
      date: new DateTime.fromMillisecondsSinceEpoch(
        json['dt'] * 1000,
        isUtc: false,
      ),
      iconUrl: 'http://openweathermap.org/img/w/' + weather['icon'] + '.png',
    );
  }

  static WeatherCondition mapToWeatherConditon(String input, int cloudiness) {
    WeatherCondition condition;
    switch (input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;
      case 'Rain':
        condition = WeatherCondition.rain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'Clear':
        condition = WeatherCondition.clear;
        break;
      case 'Clouds':
        condition = (cloudiness >= 85)
            ? WeatherCondition.heavyCloud
            : WeatherCondition.lightCloud;
        break;
      case 'Mist':
        condition = WeatherCondition.mist;
        break;
      case 'fog':
        condition = WeatherCondition.fog;
        break;
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squall':
      case 'Tornado':
        condition = WeatherCondition.atmosphere;
        break;
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }

  static int fahrenheitToCelsius(double fahrenheit) {
    double x = 2.5;
  }
}
