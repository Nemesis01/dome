import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/bloc/authentication/bloc_authentication.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/routes.dart';
import 'package:dome/themes/theme_default.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      blocBuilder: () => AuthenticationBloc(),
      blocDispose: (AuthenticationBloc bloc) => bloc?.dispose(),
      child: MaterialApp(
        //routes: routes,
        initialRoute: RouteNames.authentication,
        onGenerateRoute: generateRoute,
        title: 'Flutter Demo',
        theme: defaultAppTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
