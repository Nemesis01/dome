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
    this.backgroundColor,
    this.elevation = 1.0,
  })  : assert(child != null),
        assert(onTap != null);
  // #endregion

  // #region LifeCycle Methods
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey.shade700.withAlpha(155),
      //shadowColor: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //type: MaterialType.car,
      elevation: elevation,
      child: InkWell(
        child: Container(
          child: child,
        ),
        onTap: onTap,
      ),
    );
  }
  // #endregion
}
