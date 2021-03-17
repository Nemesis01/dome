import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/components/app_scaffold.dart';
import 'package:dome/routes.dart';
import 'package:dome/screens/screen_devices.dart';
import 'package:dome/screens/screen_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class HomeScreen extends StatefulWidget with RouteAware {

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}*/

class HomeScreen extends StatelessWidget {
  // #region Member(s)
  // int _currentMenuIndex;
  // #endregion

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return StreamBuilder<int>(
        initialData: bloc.currentMenuIndex,
        stream: bloc.indexStream,
        builder: (context, snapshot) {
          return OverviewScreen(
            currentIndex: snapshot.data,
            title: bloc.sectionTitle,
            onMenuItemSelected: (index) {
              _onMenuSelected(context, index);
              Navigator.pushNamed(context, RouteNames.values[index]);
            },
          );
        });

    /*return AppScaffold(
      currentMenuIndex: bloc.currentMenuIndex,
      title: bloc.sectionTitle,
      body: StreamBuilder<String>(
        stream: bloc.mainTitleStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return OverviewScreen(title: bloc.sectionTitle);
          return OverviewScreen(title: snapshot.data);
        },
      ),
      onMenuItemSelected: (index) async {
        _onMenuSelected(context, index);
        //await _navigateTo(context, RouteNames.devices);
      },
    );*/
  }

  Future<void> _navigateTo(BuildContext context, String routeName) async {
    var bloc = BlocProvider.of<HomeBloc>(context);

    bloc.isWideScreen
        ? Navigator.pop(context)
        : await Navigator.pushNamed(context, routeName);
  }

  void _onMenuSelected(BuildContext context, int index) {
    var bloc = BlocProvider.of<HomeBloc>(context);
    bloc.onMenuItemSelected(index);
    Navigator.pop(context);
    Navigator.pushNamed(context, RouteNames.devices);
  }
}
/**
 * 
 * 
 * 
 * 
 *  Row(
        children: [
          Expanded(
            flex: 4,
            child: StreamBuilder<int>(
              stream: bloc.indexStream,
              builder: (context, snapshot) {
                return AppDrawer(
                  titles: bloc.menus,
                  currentIndex: bloc.currentMenuIndex,
                  onTap: (index) => _onMenuSelected(index),
                );
              },
            ),
          ),
          Expanded(
            flex: 20,
            child: Scaffold(
              key: scaffoldKey,
              appBar: _buildAppBar(context),
              body: _body(context),
              /*floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DialogBox(title: 'Add'),
                  );
                },
                child: Icon(Icons.add),
              ),*/
            ),
          ),
        ],
      ),
 * 
 */