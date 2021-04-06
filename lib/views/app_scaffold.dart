import 'dart:io' show Platform;

import 'package:dome/screens/screen_base.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget implements BaseScreen {
  // #region
  final Widget child;
  // #endregion

  // #region
  AppScaffold({this.child});
  // #endregion

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    //Platform

    return screenWidth < 600
        ? smallScreenLayout(context)
        : screenWidth < 860
            ? mediumScreenLayout(context)
            : wideScreenLayout(context);
  }

  // #region UI

  // #endregion

  // #region ScreenBase Interface

  @override
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold();
  }

  @override
  Widget mediumScreenLayout(BuildContext context) {
    // TODO: implement mediumScreenLayout
    throw UnimplementedError();
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    // TODO: implement wideScreenLayout
    throw UnimplementedError();
  }
  // #endregion
}
