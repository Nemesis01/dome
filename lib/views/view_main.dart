import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  // #region Member(s)
  final String title;
  // #endregion

  // #region Constructor
  MainView({this.title = 'Current Section'});
  // #endregion

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return StreamBuilder<String>(
      initialData: bloc.sectionTitle,
      stream: bloc.mainTitleStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String title = snapshot.data;
          return Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.black45),
          );
        } else
          return Container(color: Colors.brown);
      },
    );
  }
}
