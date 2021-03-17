import 'package:dome/bloc/bloc_event_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

typedef Widget AsyncBlocEventStateBuilder<BlocState>(
    BuildContext context, BlocState state);

class BlocEventStateBuilder<BlocEvent, BlocState> extends StatelessWidget {
  final BlocEventStateBase<BlocEvent, BlocState> bloc;
  final AsyncBlocEventStateBuilder<BlocState> builder;

  const BlocEventStateBuilder({
    Key key,
    @required this.bloc,
    @required this.builder,
  })  : assert(bloc != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocState>(
      stream: bloc.state,
      initialData: bloc.initialState,
      builder: (BuildContext context, AsyncSnapshot<BlocState> snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
