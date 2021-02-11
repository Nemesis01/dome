import 'package:dome/bloc/bloc_base.dart';
import 'package:flutter/material.dart';

typedef BlocBuilder<T> = T Function();
typedef BlocDisposer<T> = Function(T);

/// Generic BLoC (Business Logic Component) provider.
///
///
///
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  //******************************************************************************
  //
  //
  //
  //******************************************************************************/
  final Widget child;
  final BlocBuilder<T> blocBuilder;
  final BlocDisposer<T> blocDispose;

  //******************************************************************************
  //
  //
  //
  //******************************************************************************/
  BlocProvider({
    Key key,
    @required this.child,
    @required this.blocBuilder,
    this.blocDispose,
  }) : super(key: key);

  //******************************************************************************
  //
  //
  //
  //******************************************************************************/
  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  //******************************************************************************
  //
  //
  //
  //******************************************************************************/
  static T of<T extends BlocBase>(BuildContext context) {
    _BlocProviderInherited<T> provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget;

    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  //
  T bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.blocBuilder();
  }

  @override
  void dispose() {
    if (widget.blocDispose != null)
      widget.blocDispose(bloc);
    else
      bloc?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _BlocProviderInherited<T>(
      bloc: bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  //
  final T bloc;

  //
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  /**************************************************************
   * 
   **************************************************************/
  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
