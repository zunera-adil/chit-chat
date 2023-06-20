import 'package:flutter/material.dart';

class reuseable_buttons extends StatelessWidget {
  reuseable_buttons(
      {required this.colour, required this.text, required this.onpress});
  final Color colour;
  final Text text;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: text,
        ),
      ),
    );
  }
}
