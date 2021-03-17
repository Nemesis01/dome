import 'package:dome/utils/colors.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  // #region Member(s)
  final Widget child;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double elevation;

  // #endregion

  // #region Constructor(s)
  Tile({
    @required this.child,
    @required this.onTap,
    this.backgroundColor = Colors.white,
    this.elevation = 0.0,
  })  : assert(child != null),
        assert(onTap != null);
  // #endregion

  // #region LifeCycle Methods
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //type: MaterialType.car,
      elevation: elevation,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Container(
          child: child,
        ),
        onTap: onTap,
      ),
    );
  }
  // #endregion
}
