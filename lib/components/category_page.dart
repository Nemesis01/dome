import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String title;

  // #region Constructor
  CategoryPage({this.title = 'title'});
  //# endregion

  // #region Lifecycle
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }
  // #endregion

}
