import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:dome/screens/screen_base.dart';

class RegistrationScreen extends StatelessWidget implements BaseScreen {
  // #region UI
  Widget body(BuildContext context) {
    return Scaffold();
  }
  // #endregion

  // #region BaseScreen Interface
  @override
  Widget mediumScreenLayout(BuildContext context) {
    // TODO: implement mediumScreenLayout
    throw UnimplementedError();
  }

  @override
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        title: Text(registerScreenTitle),
      ),
    );
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    // TODO: implement wideScreenLayout
    throw UnimplementedError();
  }

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

  // #endregion
}
