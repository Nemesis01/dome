import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/screens/screen_home.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  defaultRoute: (BuildContext context) => HomeScreen(),
  homeRoute: (BuildContext context) => HomeScreen(),
};

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case defaultRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<HomeBloc>(
          blocBuilder: () => HomeBloc(),
          blocDispose: (HomeBloc bloc) => bloc?.dispose(),
          child: HomeScreen(),
        ),
      );
    case homeRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<HomeBloc>(
          blocBuilder: () => HomeBloc(),
          blocDispose: (HomeBloc bloc) => bloc?.dispose(),
          child: HomeScreen(),
        ),
      );

    default:
      return MaterialPageRoute(builder: (BuildContext context) => Container());
  }
}
