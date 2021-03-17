import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_home.dart';
import 'package:dome/components/app_scaffold.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  // #region Member(s)
  final String title;
  final Widget page;
  final VoidCallback onScreenChanged;
  // #endregion

  // #region Constructor
  MainView({
    this.title = 'Current Section',
    this.page,
    this.onScreenChanged,
  });
  // #endregion

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      //color: Colors.blueGrey.shade900,
      child: StreamBuilder<String>(
        initialData: bloc.sectionTitle,
        stream: bloc.mainTitleStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var title = snapshot.data;

            return AppScaffold(title: title);
            /*String title = snapshot.data;
            return Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.black45),
            );*/
          } else
            return Container(color: Colors.brown);
        },
      ),
    );
  }
}
