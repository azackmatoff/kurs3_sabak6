import 'package:flutter/material.dart';
import 'package:kurs3_sabak6/circular_button.dart';
import 'package:kurs3_sabak6/constants.dart';
import 'package:kurs3_sabak6/home_screen.dart';
import 'package:kurs3_sabak6/logic/calculation_brain.dart';
import 'package:kurs3_sabak6/reusable_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key key, this.height, this.weight}) : super(key: key);

  final double height;
  final double weight;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();

    calculationBrain.calculateBMI(widget.height, widget.weight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Text(
          'BMI CALCULATOR',
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 35.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Text(
                      'Your Result',
                      style: resultTitle,
                    ),
                    const SizedBox(height: 35.0),
                    ReUsableWidget(
                      bgColor: activeIconColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              calculationBrain.getResult(),
                              style: resultSubTitle,
                            ),
                            Text(
                              calculationBrain.getResultNumber(),
                              style: resultNumber,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                calculationBrain.getInterpretation(),
                                style: titleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 35.0),
                  ],
                ),
              ),
            ),
            CustomButton(
              child: Text(
                'RE-CALCULATE',
                style: buttonTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false);
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
    );
  }
}
