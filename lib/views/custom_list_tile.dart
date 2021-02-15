import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomListTile extends StatelessWidget {
  // #region Member(s)
  final IconData leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Color color;
  final Color selectedColor;
  bool selected;
  VoidCallback onTap;
  // #endregion

  // #region Constructor
  CustomListTile({
    Key key,
    this.leading,
    @required this.title,
    this.subtitle,
    this.trailing,
    this.color = Colors.white70,
    this.selectedColor = const Color(0xff1492e6),
    this.selected = false,
    this.onTap,
  })  : assert(title != null),
        super(key: key);
  // #endregion

  // #region Lifecycle Method(s)
  @override
  Widget build(BuildContext context) {
    //var textTheme = Theme.of(context).textTheme;
    //leading.color = selected ? selectedColor : color;

    return Row(
      children: [
        FittedBox(
          fit: BoxFit.fill,
          child: Container(
            width: 4.0,
            color: selected ? selectedColor : Colors.transparent,
            child: Text(''),
          ),
        ),
        Expanded(
          child: ListTile(
            leading: Icon(
              leading ?? Icons.dashboard,
              color: selected ? selectedColor : color,
            ),
            title: Text(
              title,
              style: TextStyle(color: selected ? selectedColor : color),
            ),
            //dense: true,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
  // #endregion
}
