import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_add.dart';
import 'package:dome/bloc/authentication/bloc_authentication.dart';
import 'package:dome/blocs/bloc_devices.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/screens/screen_add.dart';
import 'package:dome/screens/screen_authentication.dart';
import 'package:dome/screens/screen_devices.dart';
import 'package:dome/screens/screen_home.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String authentication = "/authentication";
  static const String register = "/register";
  static const String home = "/home";
  static const String devices = "/devices";
  static const String temperature = "/temperature";
  static const String lights = "/lights";
  static const String rooms = "/rooms";
  static const String cameras = "/cameras";
  static const String doors = "/doors";
  static const String security = "/security";
  static const String settings = "/settings";
  static const String defaultRoute = "/";
  static const String add = "/add";

  static List<String> get values => [
        home,
        devices,
        temperature,
        lights,
        rooms,
        cameras,
        doors,
        security,
        settings,
        add,
        defaultRoute,
      ];
}

/*final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  defaultRoute: (BuildContext context) => HomeScreen(),
  homeRoute: (BuildContext context) => HomeScreen(),
};*/

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.defaultRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<HomeBloc>(
          blocBuilder: () => HomeBloc(),
          blocDispose: (HomeBloc bloc) => bloc?.dispose(),
          child: HomeScreen(),
        ),
      );
    case RouteNames.authentication:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<AuthenticationBloc>(
          blocBuilder: () => AuthenticationBloc(),
          blocDispose: (AuthenticationBloc bloc) => bloc?.dispose(),
          child: AuthenticationScreen(),
        ),
      );
    case RouteNames.home:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<HomeBloc>(
          blocBuilder: () => HomeBloc(),
          blocDispose: (HomeBloc bloc) => bloc?.dispose(),
          child: HomeScreen(),
        ),
      );
    case RouteNames.devices:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<DevicesBloc>(
          blocBuilder: () => DevicesBloc(),
          blocDispose: (DevicesBloc bloc) => bloc?.dispose(),
          child: DevicesScreen(
            currentMenuItem: 1,
            onMenuItemSelected: (index) =>
                BlocProvider.of<HomeBloc>(context).onMenuItemSelected,
          ),
        ),
      );
    case RouteNames.add:
      return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<AddBloc>(
          blocBuilder: () => AddBloc(),
          blocDispose: (AddBloc bloc) => bloc?.dispose(),
          child: AddScreen(),
        ),
      );

    default:
      return MaterialPageRoute(builder: (BuildContext context) => Container());
  }
}
