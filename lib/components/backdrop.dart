import 'package:dome/models/drawer_menu.dart';
import 'package:dome/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// TODO: Add currentRoute / currentIndex field

const double _flingVelocity = 2.0;

class Backdrop extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Menu currentMenu;

  const Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.currentMenu,
    @required this.frontTitle,
  })  : assert(backLayer != null),
        assert(frontLayer != null),
        assert(frontTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  // #region Field(s)
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'backdrop');
  AnimationController _controller;
  // #endregion

  // #region LifeCycle Methods
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => _buildStack(context, constraints),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Backdrop old) {
    super.didUpdateWidget(old);

    if (widget.currentMenu != old.currentMenu) {
      _toggleBackdropLayerVisibility();
    } else if (!_frontLayerVisible) {
      _controller.fling(velocity: _flingVelocity);
    }
  }
  // #endregion

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = MediaQuery.of(context).size;
    final double layerLeft = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          layerSize.width - 56.0, 0.0, 56.0 - layerSize.width, 0.0),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: [
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(
            title: describeEnum(widget.currentMenu).toUpperCase(),
            child: widget.frontLayer,
            animationProgress: _controller.view,
            onMenuButtonPressed: () {
              _toggleBackdropLayerVisibility();
            },
          ),
        ),
      ],
    );
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
      velocity: _frontLayerVisible ? -_flingVelocity : _flingVelocity,
    );
  }

  void toggleBackdropVisibility() {
    _toggleBackdropLayerVisibility();
  }
}

class _FrontLayer extends StatelessWidget {
  // #region Field(s)
  final Widget child;
  final String title;
  final Function onMenuButtonPressed;
  final Animation<double> animationProgress;
  // #endregion

  // #region Constructor
  const _FrontLayer({
    Key key,
    @required this.child,
    @required this.title,
    @required this.onMenuButtonPressed,
    this.animationProgress,
  }) : super(key: key);
  // #endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      //color: Colors.grey,
      //elevation: 16.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Scaffold(
              appBar: _buildAppbar(context),
              body: child,
              //backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: animationProgress,
        ),
        onPressed: onMenuButtonPressed,
      ),
      title: Text(title.toUpperCase()),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }
}
