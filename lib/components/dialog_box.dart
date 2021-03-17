import 'package:dome/components/tile.dart';
import 'package:dome/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:dome/utils/dimens.dart';

enum DialogBoxType {
  Alert,
  Confirmation,
  Simple,
  Rich,
}

class DialogBox extends StatelessWidget {
  // #region Member(s)
  final DialogBoxType type;
  final String title;
  final Widget child;
  final List<Tile> tiles;
  final List<Widget> actions;
  final Color backgroundColor;
  final VoidCallback onClose;
  // #endregion

  // #region Constructor
  const DialogBox({
    Key key,
    this.type = DialogBoxType.Simple,
    this.title,
    this.tiles,
    this.actions,
    this.backgroundColor = dialogBoxBackgroundColor,
    this.child,
    this.onClose,
  }) : super(key: key);
  // #endregion

  // #region UI
  @override
  Widget build(BuildContext context) {
    /// [dialogWidth] represents the width of the modal dialog box
    /// wich represents 80% of the screen width.
    double dialogWidth = MediaQuery.of(context).size.width * 0.8;
    double dialogHeight = MediaQuery.of(context).size.height * 0.75;

    //var _dialog = AlertDialog();

    return SimpleDialog(
      title: _titleBar(context),
      titlePadding: EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 0.0),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      children: tiles ??
          [
            Container(
              width: dialogWidth,
              height: dialogHeight,
              child: _dialogContent(context),
            )
          ],
    );
  }

  Widget _titleBar(BuildContext context) {
    var titleTheme = Theme.of(context).textTheme.headline6.copyWith();

    return Row(
      children: [
        Expanded(child: Text(title, style: titleTheme)),
        CloseButton(onPressed: () => Navigator.pop(context)),
      ],
    );
  }

  Widget _dialogContent(BuildContext context) {
    double _dialogWidth = MediaQuery.of(context).size.width * 0.6;
    double _dialogHeight = MediaQuery.of(context).size.height * 0.75;

    return Container(
      padding: defaultDialogBoxContentPadding,
      width: _dialogWidth,
      height: _dialogHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 32.0),
            child: Text(
              'What do you want to add to this place ?',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(child: _buildTiles(context)),
          _buttonBar(context),
        ],
      ),
    );
  }

  ///
  /// Returns a GridView or ListView depending on
  /// device's width and orientation.
  Widget _buildTiles(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 5,
      crossAxisSpacing: 12.0,
      children: List.generate(
        5,
        (index) => Tile(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.devices_other_outlined,
                size: 90.0,
              ),
              Text(
                'Tile $index',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buttonBar(BuildContext context) {
    /*var children = type == DialogBoxType.Simple
        ? [
            TextButton(
                onPressed: () {}, child: Text('Dismiss', style: TextStyle()))
          ]
        : actions;*/

    return ButtonBar(
      children: [
        TextButton(
          onPressed: () {},
          child: Text('cancel'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.5);
                return null; // Use the component's default.
              },
            ),
          ),
        ),
      ],
    );
  }
  // #endregion
}
/*
 Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        width: dialogWidth,
        height: dialogHeight,
        child: Column(
          children: [
            _titleBar(context),
            Expanded(child: _dialogContent(context)),
            _buttonBar(context),
          ],
        ),
      ),
*/