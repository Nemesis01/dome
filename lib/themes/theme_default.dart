import 'package:dome/themes/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData defaultAppTheme() {
  return ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.white,
    accentColor: Colors.deepPurple,
    canvasColor: Colors.white,
    fontFamily: 'Dosis',

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    textTheme: textTheme(),
    pageTransitionsTheme: PageTransitionsTheme(
        //builders: Map<TargetPlatform, >
        ),
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
