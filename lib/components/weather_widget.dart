import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_weather.dart';
import 'package:dome/models/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class WeatherWidget extends StatelessWidget {
  //
  final String city;
  //final String assetUrl;
  final int temperature;
  final int feelLikeTemperature;
  final String weatherCondition;

  // Constructor(s)
  const WeatherWidget({
    this.city = 'Trois-Rivières',
    this.temperature = -23,
    this.feelLikeTemperature = -25,
    this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<WeatherBloc>(context);

    bloc.getWeatherData('Trois-Rivières');

    return Container(
      child: StreamBuilder<WeatherData>(
          //initialData: bloc.data,
          stream: bloc.weatherDataStream,
          builder: (context, snapshot) {
            //bloc.getWeatherData('Trois-Rivières');

            if (snapshot.hasData) {
              var data = snapshot.data;
              return _weatherView(context, data);
            }
            return Container();
          }),
    );
  }

  Widget _weatherView(BuildContext context, WeatherData data) {
    return Container(
      child: Row(
        children: [
          Image.network(
            data.iconUrl,
            scale: 0.50,
          ),
          //RichText(),
          Text.rich(
            TextSpan(
              text: '           \u2103\n',
              style: TextStyle(fontSize: 24),
              children: <TextSpan>[
                TextSpan(
                  text: '${data.temperature}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            strutStyle: StrutStyle(
              //fontFamily: 'Serif',
              fontSize: 24,
              forceStrutHeight: true,
            ),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.data,
    @required this.city,
  }) : super(key: key);

  final WeatherData data;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        //padding: EdgeInsets.all(15),
        //shrinkWrap: true,
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: ImageIcon(
                  AssetImage('assets/images/png/icons8-clouds-100.png'),
                  //size: 50.0,
                  color: Colors.white,
                ),
              ),
              //Spacer(),

              Text(
                '${data.temperature}',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ressentie: ', style: Theme.of(context).textTheme.caption),
              Text('${data.feelsLikeTemperature}',
                  style: Theme.of(context).textTheme.caption),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(FeatherIcons.mapPin, size: 18.0),
              Text(
                '$city',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
