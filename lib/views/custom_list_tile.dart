import 'package:dome/models/drawer_menu.dart';
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
    this.backgoundColor,
    this.selected = false,
    this.onTap,
  })  : assert(title != null),
        super(key: key);
  // #endregion

  // #region Lifecycle Method(s)
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).accentColor;

    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
      child: Material(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0),
        ),
        color: selected ? selectedColor.withOpacity(0.10) : Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              LimitedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: selected ? selectedColor : Colors.transparent,
                  ),
                  width: 6.0,
                  height: 56.0,

                  //child: Text(''),
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
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: selected ? selectedColor : color,
                          fontWeight:
                              selected ? FontWeight.w500 : FontWeight.w400,
                        ),
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

  /* Widget indicator (BuildContext context){
    return
  }*/
  // #endregion
}
