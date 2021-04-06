import 'dart:io' show Platform;

import 'package:dome/routes.dart';
import 'package:dome/screens/screen_base.dart';
import 'package:dome/utils/strings.dart';
import 'package:dome/views/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget implements BaseScreen {
  // #region Members

  // #endregion

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: false,
      child: Scaffold(
        body: screenWidth < 600
            ? smallScreenLayout(context)
            : screenWidth < 800
                ? mediumScreenLayout(context)
                : wideScreenLayout(context),
      ),
    );
  }

  // #region ScreenBase Interface Methods
  @override
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Navigator.of(context).canPop() ? BackButton() : Container(),
        automaticallyImplyLeading: false,
        title: Text('Authentication'),
        elevation: 0.0,
      ),
      body: _body(context),
    );
  }

  @override
  Widget mediumScreenLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            child: Center(
              child:
                  Text(appName, style: Theme.of(context).textTheme.headline1),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Authentication'),
              elevation: 0.0,
            ),
            body: _body(context),
          ),
        ),
      ],
    );
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            child: Center(
              child:
                  Text(appName, style: Theme.of(context).textTheme.headline1),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Scaffold(
            body: _body(context),
          ),
        ),
      ],
    );
  }
  // #endregion

  Widget _body(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Text(appName,
                    style: Theme.of(context).textTheme.headline1)),
            Expanded(flex: 2, child: _loginForm(context)),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextField(label: 'name'),
                  CustomTextField(
                    type: TextFieldType.Password,
                    label: 'password',
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  _navigateTo(context, RouteNames.home);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Text('GO!'),
              ),
            ),
          ),
          Flexible(
            child: TextButton(
              child: RichText(
                text: TextSpan(
                  text: 'Not user yet ? ',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Create an account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => _navigateTo(context, RouteNames.register),
            ),
          ),
        ],
      ),
    );
  }

  //  #region Method(s)
  void _navigateTo(BuildContext context, String routeName) async {
    Navigator.pop(context);
    await Navigator.of(context).pushNamed(routeName);
  }
  // #endregion

}
