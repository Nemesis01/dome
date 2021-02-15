import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Footer extends StatelessWidget {
  // #region Members
  List<Widget> children;
  // #endregion

  // #region Constructor(s)
  Footer({@required this.children});
  // #endregion

  // #region Lifecycle Method(s)
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.st,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*FloatingActionButton(
            child: Icon(FeatherIcons.plus),
            onPressed: () {},
          ),*/
          ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: children,
          )
        ],
      ),
    );
  }
  // #endregion

}
