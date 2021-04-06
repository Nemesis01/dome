import 'package:dome/components/app_scaffold.dart';
import 'package:dome/models/device.dart';
import 'package:dome/routes.dart';
import 'package:dome/screens/screen_base.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget implements BaseScreen {
  // #region Constructor

  // #endregion

  // #region Lifecycle Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(devicesTitleScreen.toUpperCase()), elevation: 0.0),
      body: Container(
          child: Text('Devices Screen',
              style: Theme.of(context).textTheme.headline4)),
    );
  }
  // #endregion

  // #region UI

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

  @override
  Widget mediumScreenLayout(BuildContext context) {
    // TODO: implement mediumScreenLayout
    throw UnimplementedError();
  }

  @override
  Widget smallScreenLayout(BuildContext context) {
    // TODO: implement smallScreenLayout
    throw UnimplementedError();
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    // TODO: implement wideScreenLayout
    throw UnimplementedError();
  }
  // #endregion
}
