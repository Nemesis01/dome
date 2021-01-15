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
  final double feelLikeTemp;
  final double temperature;
  final int cloudiness;
  final DateTime date;

  //
  //
  //
  WeatherData({
    this.condition,
    this.description,
    this.temperature,
    this.feelLikeTemp,
    this.cloudiness,
    this.date,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var cloudiness = json['clouds'];
    var weather = json['weather'][0];

    return WeatherData(
      //condition: ,
      date: new DateTime.fromMillisecondsSinceEpoch(
        json['dt'] * 1000,
        isUtc: false,
      ),
      temperature: json['main']['temp'].toDouble(),
      // name: json['name'],
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
}
