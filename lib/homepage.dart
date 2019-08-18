import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile.dart';
import 'homebody.dart';
import 'pills.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> _children = [HomeBody(), ProfilePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f3f4),
      body: _children[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.flag,
                color: currentIndex == 0 ? Color(0xFF1F49AF) : Colors.grey,
              ),
              onPressed: (){
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPills()));
                },
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.user,
                color: currentIndex == 1 ? Color(0xFF1F49AF) : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


