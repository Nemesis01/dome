import 'package:dome/utils/colors.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  // #region Member(s)
  final int index;
  final IconData leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Color color;
  final Color selectedColor;
  final Color backgoundColor;
  final bool selected;
  final VoidCallback onTap;
  // #endregion

  // #region Constructor
  CustomListTile({
    Key key,
    this.index,
    this.leading,
    @required this.title,
    this.subtitle,
    this.trailing,
    this.color,
    this.selectedColor = const Color(0xff1492e6),
    this.backgoundColor,
    this.selected = false,
    this.onTap,
  })  : assert(title != null),
        super(key: key);
  // #endregion

  // #region Lifecycle Method(s)
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
      child: Material(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0),
        ),
        color: selected
            ? listTileSelectedColor.withOpacity(0.10)
            : Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SizedBox(
                height: 48.0,
                child: Container(
                  width: 6.0,
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
                    toTitleCase(title),
                    style: TextStyle(color: selected ? selectedColor : color),
                  ),
                ),
              ),
            ],
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100.0),
            bottomRight: Radius.circular(100.0),
          ),
        ),
      ),
    );
  }
  // #endregion
}
