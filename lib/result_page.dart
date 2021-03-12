import 'package:bmi_calc_flutter/input_page.dart';
import 'package:flutter/material.dart';

class MyResultPage extends StatelessWidget {
  final enumGenderButtons gender;
  final int height;
  final int weight;
  final int age;

  MyResultPage(
      {@required this.gender,
      @required this.height,
      @required this.weight,
      @required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Results'),
      ),
      body: Column(
        children: [
          Text('gender: $gender'),
          Text('height: $height'),
          Text('weight: $weight'),
          Text('age: $age')
        ],
      ),
    );
  }
}
