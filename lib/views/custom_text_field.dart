import 'package:dome/utils/strings.dart';
import 'package:flutter/material.dart';

enum TextFieldType {
  Text,
  Password,
  Email,
  PhoneNumber,
}

class CustomTextField extends FormField<String> {
  // #region Member(s)
  final TextFieldType type;
  final String label;
  final String hintText;
  final String errorMessage;
  final String helpMessage;
  final String initialValue;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  // #endregion

  // #region Constructor
  CustomTextField({
    this.type = TextFieldType.Text,
    this.label,
    this.hintText,
    this.errorMessage,
    this.helpMessage,
    this.initialValue = '',
    this.onSaved,
    this.validator,
    Key key,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// [helperText] and [counterText]
                Row(
                  children: [
                    Expanded(child: Text(helpMessage ?? '')),
                    Expanded(child: Text('${state.value.toString().length}')),
                  ],
                ),

                /// TextField
                TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                  obscureText: type == TextFieldType.Password ? true : false,
                ),

                /// Label
                Text(
                  toTitleCase(label),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          },
        );
  // #endregion

}
