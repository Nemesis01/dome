import 'package:dome/models/weather_data.dart';
import 'package:dome/bloc/bloc_base.dart';
import 'package:dome/services/repositories/weather_repository.dart';

import 'package:rxdart/rxdart.dart';

class WeatherBloc extends BlocBase {
  final _repository = WeatherRepository();

  // #region Member(s)
  WeatherData _dummyData;
  // #endregion

  // #region DartRx Controllers
  PublishSubject<WeatherData> _weatherDataController;
  // #endregion

  // #region Constructor(s)
  WeatherBloc() {
    this._dummyData = new WeatherData(
      temperature: 25,
    );

    this._weatherDataController = new PublishSubject<WeatherData>();
    //getWeatherData();
  }
  // #endregion

  /*********************************************************************
   * 
   * STREAM(S), GETTER(S) AND SETTER(S).
   * 
   **********************************************************************/
  Stream<WeatherData> get weatherDataStream => _weatherDataController.stream;
  WeatherData get data => _dummyData;

  void getWeatherData(String city) async {
    var weather = await _repository.getWeather(city);
    _weatherDataController.sink.add(weather);
    //return weather;
  }

  @override
  void dispose() {
    _weatherDataController.close();
  }
}
