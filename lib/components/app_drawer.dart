import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/models/drawer_menu.dart';
import 'package:dome/views/custom_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  // #region Member(s)
  final Menu currentMenu;
  final ValueChanged<Menu> onDrawerItemSelected;
  final List<Menu> menus;
  // #endregion

  // #region Constructor
  AppDrawer({
    @required this.currentMenu,
    @required this.onDrawerItemSelected,
    this.menus = Menu.values,
  })  : assert(currentMenu != null),
        assert(onDrawerItemSelected != null);

  // #endregion

  // #region Lyfecycle Method(s)
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      child: Drawer(
        child: Container(
          color: Color(0xfff8f8f8),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(right: width * 0.15),
            children: _buildItems(context, bloc.menus),
          ),
        ),
      ),
    );
  }
  // #endregion

  // #region UI
  Widget _buildMenuItem(
    BuildContext context,
    Menu menu,
    int index,
    IconData icon,
  ) {
    return CustomListTile(
      index: index,
      leading: icon,
      title: describeEnum(menu),
      selected: menu == currentMenu ? true : false,
      onTap: () => onDrawerItemSelected(menu),
    );
  }

  List<Widget> _buildItems(BuildContext context, List<Menu> menus) {
    var icons = [
      Icons.dashboard_outlined,
      Icons.devices_other_outlined,
      Icons.thermostat_outlined,
      Icons.lightbulb_outline,
      Icons.meeting_room_outlined,
      Icons.videocam_outlined,
      Icons.sensor_door_outlined,
      Icons.lock_outlined,
      Icons.settings_outlined,
    ];

    List<Widget> listTiles = List.generate(
      menus.length,
      (index) => _buildMenuItem(
        context,
        menus[index],
        index,
        icons[index],
      ),
    );

    listTiles.insert(0, DrawerHeader(child: Container(child: Text('Header'))));
    return listTiles;
  }

  void _updateSelectedRoute() {}
  // #endregion

}
