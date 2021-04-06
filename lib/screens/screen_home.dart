import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/components/backdrop.dart';
import 'package:dome/models/drawer_menu.dart';
import 'package:dome/screens/screen_base.dart';
import 'package:dome/utils/strings.dart';
import 'package:dome/components/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget implements BaseScreen {
  // #region Member(s)
  Widget _backdrop;
  // #endregion

  // #region Lyfecycle Methods
  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var bloc = BlocProvider.of<HomeBloc>(context);

    _backdrop = StreamBuilder<Menu>(
        stream: bloc.menuStream,
        builder: (context, snapshot) {
          return Backdrop(
            currentMenu: bloc.currentMenu,
            backLayer: Container(
              color: Colors.grey,
              child: AppDrawer(
                currentMenu: bloc.currentMenu,
                onDrawerItemSelected: (menu) {
                  _updateMenu(context, menu);
                },
              ),
            ),
            frontLayer: Container(
              child: Column(
                children: [
                  Center(child: Text('Front Layer')),
                ],
              ),
            ),
            frontTitle: Text(appName),
          );
        });

    return _screenWidth < 600
        ? smallScreenLayout(context)
        : _screenWidth < 860
            ? mediumScreenLayout(context)
            : wideScreenLayout(context);
  }
  // #endregion

// #region BaseScreen Interface
  @override
  Widget smallScreenLayout(BuildContext context) {
    return _backdrop;
  }

  @override
  Widget mediumScreenLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: AppDrawer(
              onDrawerItemSelected: (index) {},
            ),
          ),
          Expanded(
            flex: 7,
            child: LayoutBuilder(
              builder: (context, constraints) => body(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppDrawer(
              onDrawerItemSelected: (index) {},
            ),
          ),
          Expanded(
            flex: 8,
            child: LayoutBuilder(
              builder: (context, constraints) => body(context),
            ),
          ),
        ],
      ),
    );
  }
  // #endregion

  // #region UI
  Widget body(BuildContext context) {
    return Container(
      child: Text(homeTitleScreen),
    );
  }
  // #endregion

  // #region Methods
  void _updateMenu(BuildContext context, Menu menu) {
    var bloc = BlocProvider.of<HomeBloc>(context);
    bloc.onMenuItemSelected(menu);
  }

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
  // #endregion

}
