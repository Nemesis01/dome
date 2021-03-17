import 'package:dome/bloc/bloc_base.dart';
import 'package:dome/routes.dart';
import 'package:dome/route_observer.dart';
import 'package:dome/utils/strings.dart';
import 'package:rxdart/rxdart.dart';

class AppDrawerBloc extends BlocBase {
  // #region Member(s)
  bool _permanent;
  String _selectedRoute;
  int _selectedIndex;
  AppRouteObserver _routeObserver;
  List<String> _menusTitles;
  // #endregion

  // #region Controller(s)
  PublishSubject<List<String>> _titlesController;
  PublishSubject<int> _indexController;
  // #endregion

  // #region Constructor
  AppDrawerBloc() {
    this._permanent = false;
    this._selectedRoute = RouteNames.home;
    this._selectedIndex = 0;
    this._routeObserver = AppRouteObserver();

    this._titlesController = new PublishSubject<List<String>>();
    this._indexController = new PublishSubject<int>();

    // Populating titles List.
    this._menusTitles = [
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
  }
  // #endregion

  // #region Getters and Setters
  bool get permanent => this._permanent;
  String get selectedRoute => this._selectedRoute;

  List<String> get titles => this._menusTitles;
  int get selectedIndex => this._selectedIndex;
  Stream get titlesStream => this._titlesController.stream;
  Stream get indexStream => this._indexController.stream;
  // #endregion

  // #region BlocBase Interface
  @override
  void dispose() {
    this._titlesController.close();
    this._indexController.close();
  }
  // #endregion

  // #region Method(s)
  void onItemSelected(int index) {
    _updateIndex(index);
  }

  void _updateSelectedRoute(String routeName) {
    this._selectedRoute = routeName;
  }

  void _updateIndex(int newIndex) {
    this._selectedIndex = newIndex;
    this._indexController.sink.add(newIndex);
  }
  // #endegion

}
