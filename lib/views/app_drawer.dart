import 'package:dome/route_observer.dart';
import 'package:dome/routes.dart';
import 'package:dome/utils/colors.dart';
import 'package:dome/views/custom_list_tile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget with RouteAware {
  // #region Member(s)
  final List<String> titles;
  final ValueChanged<int> onMenuItemSelected;
  final int currentIndex;
  final String selectedRoute;
  final bool permanentDisplay;
  final Color backgroundColor;

  AppRouteObserver routeObserver;
  // #endregion

  // #region Constructor
  AppDrawer({
    @required this.titles,
    @required this.onMenuItemSelected,
    this.currentIndex,
    this.selectedRoute = RouteNames.home,
    this.permanentDisplay = true,
    this.backgroundColor = dialogBoxBackgroundColor,
  }) {
    this.routeObserver = new AppRouteObserver();
  }
  // #endregion

  // #region Lyfecycle Method(s)
  @override
  Widget build(BuildContext context) {
    // routeObserver.subscribe(this, ModalRoute.of(context));

    return Drawer(
      elevation: 0.0,
      child: Container(
        child: ListView(
          children: _buildItems(context),
        ),
      ),
    );
  }
  // #endregion

  // #region RouteAware Interface
  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  void didPush() {}
  // #endregion

  // #region UI
  Widget _buildItem(
    BuildContext context,
    int index,
    IconData icon,
    String title,
  ) {
    return CustomListTile(
      index: index,
      leading: icon,
      title: title,
      selected: index == currentIndex ? true : false,
      onTap: () {
        onMenuItemSelected(index);
        //_navigateTo(context, RouteNames.add);
      },
    );
  }

  List<Widget> _buildItems(BuildContext context) {
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
      titles.length,
      (index) => _buildItem(context, index, icons[index], titles[index]),
    );

    listTiles.insert(0, DrawerHeader(child: Container(child: Text('Header'))));
    return listTiles;
  }

  Future<void> _navigateTo(BuildContext context, String routeName) async {
    permanentDisplay
        ? Navigator.pop(context)
        : await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {}
  // #endregion

}
