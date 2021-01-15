import 'package:dome/screens/screen_home.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  AppStrings.ROUTE_DEFAULT: (BuildContext context) => HomeScreen(),
  AppStrings.ROUTE_HOME: (BuildContext context) => HomeScreen(),
};
