import 'package:dome/bloc/bloc_base.dart';
import 'package:dome/routes.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase with RouteAware {
// #region Members
  String _mainTitle;
  String _selectedRoute;
  List<String> _menus = [
    titleOverview,
    titleDevices,
    titleTemperature,
    titleLights,
    titleRooms,
    titleCameras,
    titleDoors,
    titleSecurity,
    titleSettings,
  ];
  int _currentMenuIndex;
  bool _isWideScreen;
// #endregion

  // #region Controllers, RxDart Subjects
  PublishSubject<String> _mainTitleController;
  PublishSubject<List<String>> _menusController;
  PublishSubject<int> _indexController;
  // #endregion

  // #region Constructor
  HomeBloc() {
    this._mainTitleController = new PublishSubject<String>();
    this._menusController = new PublishSubject<List<String>>();
    this._indexController = new PublishSubject<int>();
    this._currentMenuIndex = 0;
    this._mainTitle = _menus[_currentMenuIndex];
    this._selectedRoute = RouteNames.home;

    this._isWideScreen = true;

    //this._mainTitleController.listen(updateTitle);
  }
  // #endregion

  // #region Observables, Streams
  Stream<String> get mainTitleStream => this._mainTitleController.stream;
  Stream<List<String>> get menusStream => this._menusController.stream;
  Stream<int> get indexStream => this._indexController.stream;

  String get sectionTitle => this._mainTitle.toUpperCase();
  List<String> get menus => this._menus;
  int get currentMenuIndex => this._currentMenuIndex;
  bool get isWideScreen => this._isWideScreen;
  // #endregion

  // #region Method(s)
  void onMenuItemSelected(int index) {
    _updateTitle(_menus[index]);
    _updateIndex(index);
  }

  void _updateTitle(String newTitle) {
    this._mainTitle = newTitle.toUpperCase();
    this._mainTitleController.sink.add(newTitle.toUpperCase());
    //print('Menu Item tapped');
  }

  void _updateIndex(int newIndex) {
    this._currentMenuIndex = newIndex;
    this._indexController.sink.add(newIndex);

    print('Updating Index from HomeBloc class');
    print('new selected index is : $currentMenuIndex');
  }

  void _updateSelectedRoute() {}
  // #endregion

  // #region BlocBase Interface
  @override
  void dispose() {
    _mainTitleController.close();
    _menusController.close();
    _indexController.close();
  }

  // #endregion
}
