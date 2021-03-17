import 'package:dome/components/tile.dart';
import 'package:dome/utils/dimens.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  // #region
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: _dialogContent(context)));
  }
  // #endregion

  // #region UI
  Widget _dialogContent(BuildContext context) {
    double _dialogWidth = MediaQuery.of(context).size.width * 0.6;
    double _dialogHeight = MediaQuery.of(context).size.height * 0.75;

    return Container(
      color: Colors.indigoAccent,
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
