import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtmNavBar extends StatefulWidget {
  @override
  _BtmNavBarState createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.flag,
              color: Colors.blue,
            ),
          ),
          IconButton(icon: Icon(FontAwesomeIcons.link)),
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.plus),
            ),
          ),
          IconButton(icon: Icon(FontAwesomeIcons.bell)),
          IconButton(icon: Icon(FontAwesomeIcons.user)),
        ],
      ),
    );
  }
}