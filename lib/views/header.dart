import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/utils/dimens.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  // #region Member(s)
  final String title;
  final List<Widget> actions;
  final VoidCallback onActionSelected;
  // #endregion

  // #region Constructor
  const Header({
    Key key,
    @required this.title,
    this.actions,
    this.onActionSelected,
  }) : super(key: key);
  // #endregion

  // #region UI
  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<HomeBloc>(context);
    var _actions = this.actions;
    _actions = _actions ??
        [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.add),
            onPressed: onActionSelected,
            tooltip: 'Add',
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: onActionSelected,
            tooltip: 'Search',
          ),
        ];

    return StreamBuilder<String>(
        initialData: _bloc.sectionTitle,
        stream: _bloc.mainTitleStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      snapshot.data,
                      style: Theme.of(context).textTheme.headline5.copyWith(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _actions,
                  )
                ],
              ),
            );
          } else
            return Container();
        });
  }

  // #endregion

  // #region Method(s)
  // #endregion
}
