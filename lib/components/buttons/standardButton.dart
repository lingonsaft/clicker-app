import 'package:flutter/material.dart';

/**
 * Standard button used for most of the game
 * TODO: add standard button styles to text and RaisedButton
 */
class StandardButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final TextStyle textStyle;

  StandardButton({
    this.text,
    this.onPressed,
    this.textStyle = const TextStyle()
  });

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      child: Text(this.text, style: this.textStyle),
      onPressed: () => this.onPressed(),
    );
  }
}
