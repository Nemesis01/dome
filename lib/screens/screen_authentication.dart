import 'package:dome/routes.dart';
import 'package:dome/screens/screen_base.dart';
import 'package:dome/utils/strings.dart';
import 'package:dome/views/custom_text_field.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget implements BaseScreen {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // TODO: Create appBar builder Method.
      /*appBar: screenWidth < 600
          ? AppBar(
              //automaticallyImplyLeading: screenWidth < 600 ? true : false,
              title: Text(loginScreenTitle),
            )
          : null,*/
      body: screenWidth < 600
          ? smallScreenLayout(context)
          : screenWidth < 800
              ? mediumScreenLayout(context)
              : wideScreenLayout(context),
    );
  }

  // #region ScreenBase Interface Methods
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
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authentication')),
      body: _body(context),
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
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Form(
          child: Column(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      children: [],
    );
  }

  //  #region Method(s)
  void _navigateTo(BuildContext context, String routeName) async {
    Navigator.pop(context);
    await Navigator.of(context).pushNamed(routeName);
  }
  // #endregion

}
