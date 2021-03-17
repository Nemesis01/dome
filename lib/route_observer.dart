import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver<PageRoute> {
  // #region Member(s)
  static final AppRouteObserver _instance = AppRouteObserver._private();
  // #endregion

  AppRouteObserver._private();

  factory AppRouteObserver() => _instance;
}
