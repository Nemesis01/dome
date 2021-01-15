import 'package:dome/components/weather_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Weather overview
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Text('hello'),
              WeatherWidget(),
            ],
          ),
          Row(
            children: [
              Card(
                //elevation: 4.0,
                //color: Colors.blueGrey,
                child: Icon(
                  CupertinoIcons.home,
                  size: 200.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
