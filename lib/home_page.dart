import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs3_sabak6/icon_widget.dart';

enum Gender { MALE, FEMALE, UNKNOWN }

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color inActiveIconColor = Color(0xff111328);
  Color activeIconColor = Color(0xFF15173B);

  double sliderValue = 120;

  String jynys = 'belgisiz';

  Gender gender = Gender.UNKNOWN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35.0),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconWidget(
                        text: 'MALE',
                        bgColor: gender == Gender.MALE
                            ? activeIconColor
                            : inActiveIconColor,
                        icon: FontAwesomeIcons.mars,
                        onTap: () => iconClicked(Gender.MALE),
                      ),
                      const SizedBox(width: 34.0),
                      IconWidget(
                        onTap: () => iconClicked(Gender.FEMALE),
                        text: 'FEMALE',
                        bgColor: gender == Gender.FEMALE
                            ? activeIconColor
                            : inActiveIconColor,
                        icon: FontAwesomeIcons.venus,
                      ),
                      //Versiya 2: Ushunday turdo da jazsa bolot
                      // IconWidget(
                      //   text: 'MALE',
                      //   bgColor: jynys == 'erkek'
                      //       ? activeIconColor
                      //       : inActiveIconColor,
                      //   icon: FontAwesomeIcons.mars,
                      //   onTap: () => iconClicked2('erkek'),
                      // ),
                      // const SizedBox(width: 34.0),
                      // IconWidget(
                      //   onTap: () => iconClicked2('ayal'),
                      //   text: 'FEMALE',
                      //   bgColor: jynys == 'ayal'
                      //       ? activeIconColor
                      //       : inActiveIconColor,
                      //   icon: FontAwesomeIcons.venus,
                      // ),

                      // buildIconWidget(),
                    ],
                  ),
                ),
                const SizedBox(width: 34.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: activeIconColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              sliderValue.round().toString(),
                              style: TextStyle(fontSize: 45.0),
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
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 18.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: sliderValue,
                            min: 50,
                            max: 240,
                            onChanged: (double ozgorgonSan) {
                              setState(() {
                                sliderValue = ozgorgonSan;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(width: 34.0),
                // Expanded(
                //   child: Container(
                //     color: Colors.amber,
                //     // height: 100.0,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void iconClicked(Gender clickedGender) {
    setState(() {
      gender = clickedGender;
    });
  }

  void iconClicked2(String tandalganJynys) {
    setState(() {
      jynys = tandalganJynys;
    });
  }

//bul widget emes metod menen ishtegendin jolu (bul jon gana misal)
  Expanded buildIconWidget() {
    return Expanded(
      child: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.venus,
              size: 75.0,
            ),
            Text(
              'text',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
