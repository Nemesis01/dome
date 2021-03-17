import 'package:dome/components/app_scaffold.dart';
import 'package:dome/models/device.dart';
import 'package:dome/routes.dart';
import 'package:dome/screens/screen_base.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  // #region Members
  final int currentMenuItem;
  final String title;
  final ValueChanged<int> onMenuItemSelected;
  // #endregion

  // #region Constructor
  DevicesScreen({
    this.currentMenuItem,
    this.onMenuItemSelected,
    this.title = RouteNames.devices,
  }) {
    //BaseScreen(this._title);
  }
  // #endregion

  // #region Lifecycle Methods
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      //currentMenuIndex: currentMenuItem,
      title: title,
      body: _body(context),
      onMenuItemSelected: onMenuItemSelected,
    );
  }
  // #endregion

  // #region UI
  Widget _appBar(BuildContext context) {
    return AppBar(
      title: Text(this.title ?? 'Oops!'),
      elevation: 0.0,
    );
  }

  Widget _body(BuildContext context) {
    return StreamBuilder<List<Device>>(builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(itemBuilder: (context, index) => ListTile());
      }
      return Column(
        children: [
          Icon(
            Icons.devices_other_outlined,
            size: 128.0,
          ),
          Text(
            'You have no devices added for the moment.',
            style: Theme.of(context).textTheme.headline3,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Add new device'),
          )
        ],
      );
    });
  }
  // #endregion
}
