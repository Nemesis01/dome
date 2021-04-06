import 'package:dome/bloc/bloc_base.dart';
import 'package:dome/models/drawer_menu.dart';
import 'package:dome/routes.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase with RouteAware {
// #region Members
  String _mainTitle;
  String _selectedRoute;
  List<Menu> _menus = Menu.values;
  Menu _currentMenu;
  int _currentMenuIndex;
  bool _isWideScreen;
// #endregion

  // #region Controllers, RxDart Subjects
  PublishSubject<String> _mainTitleController;
  PublishSubject<List<Menu>> _drawerMenusController;
  PublishSubject<Menu> _menuController;
  PublishSubject<List<String>> _menusController;
  PublishSubject<int> _indexController;
  // #endregion

  // #region Constructor
  HomeBloc() {
    this._mainTitleController = new PublishSubject<String>();
    this._drawerMenusController = new PublishSubject<List<Menu>>();
    this._menusController = new PublishSubject<List<String>>();
    this._indexController = new PublishSubject<int>();
    this._menuController = new PublishSubject<Menu>();

    this._currentMenu = Menu.values[0];
    this._currentMenuIndex = 0;
    this._mainTitle = /*_menus[_currentMenuIndex]*/ '';
    this._selectedRoute = RouteNames.home;

    this._isWideScreen = true;

    //this._mainTitleController.listen(updateTitle);
  }
  // #endregion

  // #region Observables, Streams
  Stream<String> get mainTitleStream => this._mainTitleController.stream;
  Stream<List<String>> get menusStream => this._menusController.stream;
  Stream<List<Menu>> get drawerMenusStream =>
      this._drawerMenusController.stream;
  Stream<int> get indexStream => this._indexController.stream;
  Stream<Menu> get menuStream => this._menuController.stream;

  String get sectionTitle => this._mainTitle.toUpperCase();
  List<Menu> get menus => this._menus;
  Menu get currentMenu => this._currentMenu;
  int get currentMenuIndex => this._currentMenuIndex;
  bool get isWideScreen => this._isWideScreen;
  // #endregion

  // #region Method(s)
  void onMenuItemSelected(Menu menu) {
    //_updateTitle(describeEnum(_menus[index]));
    _updateMenu(menu);
    print('Hello $menu');
  }

  void _updateMenu(Menu menu) {
    this._currentMenu = menu;
    this._menuController.sink.add(menu);
  }
  // #endregion

  // #region BlocBase Interface
  @override
  void dispose() {
    _mainTitleController.close();
    _drawerMenusController.close();
    _menusController.close();
    _menuController.close();
    _indexController.close();
  }

  // #endregion
}
