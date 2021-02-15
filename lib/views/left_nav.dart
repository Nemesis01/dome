import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/views/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LeftMenu extends StatelessWidget {
  // #region Member(s)
  List<String> menus = [];
  List<IconData> icons = [
    Icons.dashboard_outlined,
    Icons.kitchen_outlined,
    Icons.thermostat_outlined,
    Icons.lightbulb_outline,
    Icons.camera_outlined,
    Icons.sensor_door_outlined,
    Icons.lock_outline,
    Icons.settings_outlined,
  ];
  VoidCallback onItemTap;
  // #endregion

  // #region Constructor
  LeftMenu({
    this.menus,
    @required this.onItemTap,
  });
  // #endregion

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    this.menus = bloc.menus;
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Drawer(
            elevation: 0.0,
            child: Container(
              color: Colors.black87,
              child: _tiles(context, menus),
            ),
          );
        });
  }

  ListView _tiles(BuildContext context, List<String> menus) {
    var listView = ListView.builder(
      shrinkWrap: true,
      itemCount: menus.length,
      itemBuilder: (context, index) => CustomListTile(
        leading: icons[index],
        title: menus[index],
        onTap: onItemTap,
      ),
    );
    return listView;
  }
}
