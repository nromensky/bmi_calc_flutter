import 'package:flutter/material.dart';

// my files
import 'resources.dart';
import 'input_page.dart';

void main() {
  runApp(MyBMICalc());
}

class MyBMICalc extends StatefulWidget {
  @override
  _MyBMICalcState createState() => _MyBMICalcState();
}

class _MyBMICalcState extends State<MyBMICalc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kBackgroundColor,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              color: kNotSelectedButtonTextColor,
              fontSize: 31,
              fontFamily: 'PoiretOne',
            ),
          ),
        ),
        sliderTheme: SliderThemeData(
          inactiveTrackColor: kSelectedButtonTextColor,
          activeTrackColor: kSelectedButtonColor,
          thumbColor: kSelectedButtonColor,
          overlayColor: kNotSelectedButtonColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: kNotSelectedButtonTextColor,
            shadowColor: kNotSelectedButtonColor,
            backgroundColor: kNotSelectedButtonColor,
            elevation: 3,
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'PoiretOne',
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'PoiretOne',
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
