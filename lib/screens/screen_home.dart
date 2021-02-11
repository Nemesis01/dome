import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_date_time.dart';
import 'package:dome/blocs/bloc_weather.dart';
import 'package:dome/components/date_time_widget.dart';
import 'package:dome/components/tile.dart';
import 'package:dome/components/weather_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    StaggeredTile.count(13, 8),
    StaggeredTile.count(8, 4),
    StaggeredTile.count(4, 4),
    StaggeredTile.count(4, 4),
    StaggeredTile.count(21, 3),
  ];

  List<Widget> _tiles = [
    Tile(
      child: Container(
          child: Text('rooms',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
              ))),
      onTap: () {},
    ),
    Tile(
      child: Container(),
      onTap: () {},
    ),
    Tile(
      child: Container(),
      onTap: () {},
    ),
    Tile(
      child: Container(),
      onTap: () {},
    ),

    /* Container(color: Colors.grey),
    Container(color: Colors.grey),
    Container(color: Colors.grey),
    Container(color: Colors.grey),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _body(context),
      backgroundColor: Colors.blueGrey.shade900,
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    _tiles.insert(
      0,
      Tile(
        //color: Colors.red,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocProvider<DateTimeBloc>(
                  blocBuilder: () => DateTimeBloc(),
                  blocDispose: (DateTimeBloc bloc) => bloc?.dispose(),
                  child: DateTimeWidget(),
                ),
              ),
              Expanded(
                child: BlocProvider<WeatherBloc>(
                  blocBuilder: () => WeatherBloc(),
                  blocDispose: (WeatherBloc bloc) => bloc?.dispose(),
                  child: WeatherWidget(),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );

    return Column(
      children: [
        _header(context),
        Expanded(
          flex: 8,
          child: _dashBoard(context),
        ),
        Expanded(
          flex: 2,
          child: _roomsControl(context),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      color: Colors.indigo,
      child: Row(
        children: [],
      ),
    );
  }

  Widget _dashBoard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 10.0,
      ),
      //color: Colors.red,
      child: Row(
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
              flex: 10,
              child: Container(
                //color: Colors.blueGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontFamily: 'Quicksand', color: Colors.white38),
                    ),
                    _staggeredGridView(context),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _roomsControl(BuildContext context) {
    return Container(
      color: Colors.transparent,
    );
  }

  Widget _staggeredGridView(BuildContext context) {
    return StaggeredGridView.count(
      shrinkWrap: true,
      crossAxisCount: 21,
      staggeredTiles: _staggeredTiles,
      children: _tiles,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: EdgeInsets.all(4.0),
    );
  }

  void onTileTap() {}
}
