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
    return Material(
      type: MaterialType.card,
      //elevation: 4.0,
      //color: Colors.grey,
      child: Container(
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
                  ),
                ),
                //Spacer(),

                Text(
                  '$temperature',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ressentie: '),
                Text('$feelLikeTemperature'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(FeatherIcons.mapPin, size: 18.0),
                Text('$city', style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
