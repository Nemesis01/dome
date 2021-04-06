import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/components/app_scaffold.dart';
import 'package:dome/models/drawer_menu.dart';
import 'package:dome/routes.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  // #region Member(s)
  final String title;
  final int currentIndex;
  final ValueChanged<Menu> onMenuItemSelected;
  // #endregion

  // #region Constructor(s)
  OverviewScreen({
    this.title = RouteNames.home,
    this.currentIndex,
    this.onMenuItemSelected,
    Key key,
  }) : super(key: key);
  // #endregion

  // #region UI
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return AppScaffold(
      //currentMenuIndex: bloc.currentMenuIndex,
      title: title,
      body: Container(
        child: Text(RouteNames.home),
      ),
      onMenuItemSelected: onMenuItemSelected,
    );
  }
  // #endregion
}
