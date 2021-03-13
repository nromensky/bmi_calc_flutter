import 'package:flutter/material.dart';

const Color kBackgroundColor = Colors.white;

const Color kSelectedButtonColor = Colors.blueGrey;
const Color kSelectedButtonTextColor = Colors.white;
const Color kNotSelectedButtonColor = Colors.white30;
const Color kNotSelectedButtonTextColor = Colors.black45;

const kMinWeight = 20;
const kMaxWeight = 200;
const kMinAge = 5;
const kMaxAge = 150;

class MyCircleButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  MyCircleButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      shape: CircleBorder(),
      fillColor: kSelectedButtonColor,
      constraints: BoxConstraints.tightFor(width: 45, height: 45),
      child: this.icon,
    );
  }
}

class MyValueText extends StatelessWidget {
  final int value;
  final String unit;

  MyValueText({@required this.value, @required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontFamily: 'NovaMono',
            fontSize: 39,
          ),
        ),
        Text(this.unit),
      ],
    );
  }
}
