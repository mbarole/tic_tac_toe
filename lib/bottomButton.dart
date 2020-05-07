import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onpress;
  final String text;

  BottomButton({@required this.text, @required this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        color: Colors.greenAccent,
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
