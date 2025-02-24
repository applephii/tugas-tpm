import 'package:flutter/material.dart';

class KalkulatorButton extends StatelessWidget {
  const KalkulatorButton({
    Key? key,
    required this.text,
    required this.callback,
    required this.fillColor,
    required this.textColor
  }) : super(key: key);
  final String text;
  final Color fillColor;
  final Color textColor;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 80,
        height: 80,
        child: TextButton(
          onPressed: () => {callback(text)},
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: fillColor,
            foregroundColor: textColor,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
