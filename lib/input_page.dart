import 'package:bmi_calc_flutter/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'resources.dart';

enum enumGenderButtons { male, female }

class MyInputPage extends StatefulWidget {
  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyInputPageState extends State<MyInputPage> {
  enumGenderButtons selectedGenderButton;
  int selectedWeight = 55;
  int selectedHeight = 165;
  int selectedAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            // *********** GENDER section *************

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary:
                              selectedGenderButton == enumGenderButtons.male
                                  ? kSelectedButtonTextColor
                                  : kNotSelectedButtonTextColor,
                          backgroundColor:
                              selectedGenderButton == enumGenderButtons.male
                                  ? kSelectedButtonColor
                                  : kNotSelectedButtonColor,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedGenderButton = enumGenderButtons.male;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.genderMale, size: 49),
                            Text('MALE'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary:
                              selectedGenderButton == enumGenderButtons.female
                                  ? kSelectedButtonTextColor
                                  : kNotSelectedButtonTextColor,
                          backgroundColor:
                              selectedGenderButton == enumGenderButtons.female
                                  ? kSelectedButtonColor
                                  : kNotSelectedButtonColor,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedGenderButton = enumGenderButtons.female;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.genderFemale, size: 49),
                            Text('FEMALE'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // ************** HEIGHT section **************

            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TextButton(
                    onPressed: null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('HEIGHT'),
                        MyValueText(value: selectedHeight, unit: 'cm'),
                        Slider(
                          value: selectedHeight.toDouble(),
                          min: 100,
                          max: 240,
                          onChanged: (double value) {
                            setState(() {
                              selectedHeight = value.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),

            // *********** WEIGHT and AGE section ***********

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        onPressed: null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('WEIGHT'),
                            MyValueText(value: selectedWeight, unit: 'kg'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyCircleButton(
                                  icon: Icon(MdiIcons.minusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedWeight > kMinWeight
                                          ? selectedWeight--
                                          // ignore: unnecessary_statements
                                          : null;
                                    });
                                  },
                                ),
                                MyCircleButton(
                                  icon: Icon(MdiIcons.plusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedWeight < kMaxWeight
                                          ? selectedWeight++
                                          // ignore: unnecessary_statements
                                          : null;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        onPressed: null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('AGE'),
                            MyValueText(value: selectedAge, unit: ''),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyCircleButton(
                                  icon: Icon(MdiIcons.minusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedAge > kMinAge
                                          ? selectedAge--
                                          // ignore: unnecessary_statements
                                          : null;
                                    });
                                  },
                                ),
                                MyCircleButton(
                                  icon: Icon(MdiIcons.plusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedAge < kMaxAge
                                          ? selectedAge++
                                          // ignore: unnecessary_statements
                                          : null;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // *********** CALCULATE button section ***********

            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: selectedGenderButton != null
                        ? kSelectedButtonTextColor
                        : kNotSelectedButtonTextColor,
                    backgroundColor: selectedGenderButton != null
                        ? Colors.redAccent
                        : kNotSelectedButtonColor,
                  ),
                  onPressed: () {
                    selectedGenderButton != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyResultPage(
                                gender: selectedGenderButton,
                                age: selectedAge,
                                height: selectedHeight,
                                weight: selectedWeight,
                              ),
                            ),
                          )
                        // ignore: unnecessary_statements
                        : null;
                  },
                  child: Text(
                    'CALCULATE',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
