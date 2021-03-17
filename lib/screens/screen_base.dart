import 'package:flutter/material.dart';

abstract class BaseScreen {
  // final String _title;

  //BaseScreen(this._title);

  Widget smallScreenLayout(BuildContext context);
  Widget mediumScreenLayout(BuildContext context);
  Widget wideScreenLayout(BuildContext context);
}
