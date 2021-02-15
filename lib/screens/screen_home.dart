import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_date_time.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/blocs/bloc_weather.dart';
import 'package:dome/components/date_time_widget.dart';
import 'package:dome/components/tile.dart';
import 'package:dome/components/weather_widget.dart';
import 'package:dome/views/footer.dart';
import 'package:dome/views/left_nav.dart';
import 'package:dome/views/view_main.dart';
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
  // #region Member(s) */
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
  ];

  // #endregion */

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LeftMenu(
          onItemTap: onMenuSelected,
        ),
        Expanded(
          child: Scaffold(
            //appBar: AppBar(),
            body: _body(context),
            backgroundColor: Color(0xff20353d),
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return Material(
      //shadowColor: Colors.white30,
      elevation: 8.0,
      //borderRadius: BorderRadius(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
        ),
      ),
      color: Colors.white70,
      child: Column(
        children: [
          // _header(context),
          Expanded(
            flex: 8,
            child: MainView(),
          ),
          Expanded(
            flex: 2,
            child: Footer(
              children: [],
            ),
          ),
        ],
      ),
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

  void onMenuSelected() {
    var bloc = BlocProvider.of<HomeBloc>(context);
    bloc.updateTitle('Title chamged');
  }
}
