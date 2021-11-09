import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onTap,
    this.bgColor,
  }) : super(key: key);

  final String text;
  final Color bgColor;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width: 100,
          ///BoxDecoration bar bolso tus oshol jaktan berilet, Container den berilbeyt
          // color: Colors.red,
          decoration: BoxDecoration(
            /// ?? degnedin maanisi => egerde bgColor null bolso, Color(0xff111328) ushul tustu ber
            color: bgColor ?? Color(0xff111328),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: 75.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
