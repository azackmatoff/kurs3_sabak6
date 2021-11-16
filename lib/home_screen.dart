import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs3_sabak6/circular_button.dart';
import 'package:kurs3_sabak6/constants.dart';
import 'package:kurs3_sabak6/enums.dart';
import 'package:kurs3_sabak6/icon_widget.dart';
import 'package:kurs3_sabak6/result_screen.dart';
import 'package:kurs3_sabak6/reusable_widget.dart';
import 'package:kurs3_sabak6/weight_heigth_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender gender = Gender.UNKNOWN;
  WeightOrAge weightOrAge;
  double _height;
  int _weigth;
  int _age;

  @override
  void initState() {
    super.initState();

    _height = 120;
    _weigth = 45;
    _age = 16;
  }

  void _decrement(WeightOrAge chosenType) {
    if (chosenType == WeightOrAge.WEIGHT) {
      _weigth--;
    } else {
      _age--;
    }

    setState(() {});
  }

  void _increment(WeightOrAge chosenType) {
    if (chosenType == WeightOrAge.WEIGHT) {
      _weigth++;
    } else {
      _age++;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25.0),
                      Expanded(
                        child: Row(
                          children: [
                            ReUsableWidget(
                              onTap: () => chooseGender(Gender.MALE),
                              bgColor: gender == Gender.MALE
                                  ? activeIconColor
                                  : inActiveIconColor,
                              child: IconWidget(
                                icon: FontAwesomeIcons.mars,
                                text: 'MALE',
                                allPaddingSize: 32.0,
                              ),
                            ),
                            const SizedBox(width: 25.0),
                            ReUsableWidget(
                              onTap: () => chooseGender(Gender.FEMALE),
                              bgColor: gender == Gender.FEMALE
                                  ? activeIconColor
                                  : inActiveIconColor,
                              child: IconWidget(
                                icon: FontAwesomeIcons.venus,
                                text: 'FEMALE',
                                allPaddingSize: 32.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      ReUsableWidget(
                        onTap: null,
                        bgColor: activeIconColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HEIGHT',
                              style: titleTextStyle,
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  _height.round().toString(),
                                  style: numberTextStyle,
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  'cm',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 2.0,
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.grey,
                                thumbColor: Colors.red,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 18.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                overlayColor: Color(0x29EB1555),
                              ),
                              child: Slider(
                                value: _height,
                                min: 50,
                                max: 240,
                                onChanged: (double ozgorgonSan) {
                                  setState(() {
                                    _height = ozgorgonSan;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Expanded(
                        child: Row(
                          children: [
                            ReUsableWidget(
                              onTap: null,
                              bgColor: activeIconColor,
                              child: WeightHeightWidget(
                                title: 'WEIGHT',
                                weight: _weigth.toString(),
                                increment: () => _increment(WeightOrAge.WEIGHT),
                                decrement: () => _decrement(WeightOrAge.WEIGHT),
                              ),
                            ),
                            const SizedBox(width: 25.0),
                            ReUsableWidget(
                              onTap: null,
                              bgColor: activeIconColor,
                              child: WeightHeightWidget(
                                title: 'AGE',
                                age: _age.toString(),
                                increment: () => _increment(WeightOrAge.AGE),
                                decrement: () => _decrement(WeightOrAge.AGE),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35.0),
                    ],
                  ),
                ),
              ),
              CustomButton(
                child: Text(
                  'CALCULATE',
                  style: buttonTextStyle,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                height: _height,
                                weight: _weigth.toDouble(),
                              )));
                },
                buttonColor: buttonColor,
                constraints: BoxConstraints(
                  minHeight: 92,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseGender(Gender chosenGender) {
    setState(() {
      gender = chosenGender;
    });
  }
}
