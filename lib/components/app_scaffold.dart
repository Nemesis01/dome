import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/views/app_drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  // #region Members
  //final int currentMenuIndex;
  final String title;
  final Widget body;
  final ValueChanged<int> onMenuItemSelected;
  // #endregion

  // #region Constructor
  AppScaffold({
    // @required this.currentMenuIndex,
    @required this.title,
    @required this.body,
    @required this.onMenuItemSelected,
    Key key,
  }) : super(key: key);
  // #endregion

  @override
  Widget build(BuildContext context) {
    //var screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? _smallScreenLayout(context, constraints)
            : _wideScreenLayout(context);
      },
    );
  }

  Widget _wideScreenLayout(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return Row(
      children: [
        StreamBuilder<int>(
          initialData: bloc.currentMenuIndex,
          stream: bloc.indexStream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (!snapshot.hasData)
              return AppDrawer(
                titles: bloc.menus,
                currentIndex: bloc.currentMenuIndex,
                onMenuItemSelected: onMenuItemSelected,
              );
            return AppDrawer(
              titles: bloc.menus,
              currentIndex: snapshot.data,
              onMenuItemSelected: onMenuItemSelected,
            );
          },
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(title),
              elevation: 0.0,
            ),
            body: body,
          ),
        ),
      ],
    );
  }

  Widget _smallScreenLayout(BuildContext context, BoxConstraints constraints) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      drawer: StreamBuilder<int>(
        initialData: bloc.currentMenuIndex,
        stream: bloc.indexStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          //var index = snapshot.data;
          return AppDrawer(
            titles: bloc.menus,
            currentIndex: snapshot.data,
            onMenuItemSelected: onMenuItemSelected,
          );
        },
      ),
    );
  }
}
