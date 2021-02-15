import 'package:dome/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
// #region Members
  String _mainTitle;
  List<String> _menus = [
    'Overview',
    'Appliances',
    'Temperature',
    'Lights',
    'Cameras',
    'Doors',
    'Security',
    'Settings',
  ];
// #endregion

  // #region Controllers, RxDart Subjects
  PublishSubject<String> _mainTitleController;
  PublishSubject<List<String>> _menusController;
  // #endregion

  // #region Constructor
  HomeBloc() {
    this._mainTitle = 'Section Title';
    this._mainTitleController = new PublishSubject<String>();
    this._mainTitleController.listen(updateTitle);
  }
  // #endregion

  // #region Observables, Streams
  Stream<String> get mainTitleStream => this._mainTitleController.stream;
  Stream<List<String>> get menusStream => this._menusController.stream;
  String get sectionTitle => this._mainTitle;
  List<String> get menus => this._menus;
  // #endregion

  // #region Method(s)
  void updateTitle(String newTitle) {
    this._mainTitle = newTitle;
    this._mainTitleController.sink.add(newTitle);
  }
  // #endregion

  // #region BlocBase Interface
  @override
  void dispose() {
    _mainTitleController.close();
    _menusController.close();
  }
  // #endregion
}
