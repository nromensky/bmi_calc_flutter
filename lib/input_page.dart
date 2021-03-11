import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'constants.dart';

enum enumGenderButtons { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  enumGenderButtons selectedGenderButton;
  int selectedWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: [
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
                        Text(
                          'WEIGHT',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              selectedWeight.toString(),
                              textScaleFactor: 2,
                            ),
                            Text('kg')
                          ],
                        ),
                        Slider(
                          value: selectedWeight.toDouble(),
                          min: 40,
                          max: 140,
                          onChanged: (double value) {
                            setState(() {
                              selectedWeight = value.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 3, child: Row()),
            Expanded(flex: 1, child: Row()),
          ],
        ));
  }
}
