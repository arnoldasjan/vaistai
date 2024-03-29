import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPills extends StatefulWidget {
  @override
  _AddPillsState createState() => _AddPillsState();
}

class _AddPillsState extends State<AddPills> {
  TextStyle _kTextFieldNameStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16.0,
  );

  TextStyle _kDescriptionTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 14.0,
    color: Colors.grey[700],
  );

  double _numberOfPills = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f3f4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 15.0, right: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Pridėti vaistus',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Vaistų pavadinimas', style: _kTextFieldNameStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          helperStyle: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'Lato',
                              color: Colors.black),
                          contentPadding: EdgeInsets.only(
                              top: 15.0, left: 20.0, bottom: 15.0),
                          hintText: 'Ibuprofen, 200 mg',
                          hintStyle: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Noto Sans',
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Kiekis', style: _kTextFieldNameStyle),
                      ],
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Kiek tablečių sudaro viena dozė?',
                            style: _kDescriptionTextStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF1F49AF),
                              ),
                              child: Center(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_numberOfPills > 0.5) {
                                          _numberOfPills -= 0.5;
                                        }
                                      });
                                    }),
                              ),
                            ),
                            Text(
                              '${_numberOfPills} tabletės',
                              style: TextStyle(
                                  fontSize: 32.0,
                                  color: Colors.black,
                                  fontFamily: 'Noto Sans'),
                            ),
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF1F49AF),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _numberOfPills += 0.5;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Trukmė', style: _kTextFieldNameStyle),
                      ],
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Kiek dienų vartosite vaistus?',
                            style: _kDescriptionTextStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          helperStyle: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'Lato',
                              color: Colors.black),
                          contentPadding: EdgeInsets.only(
                              top: 15.0, left: 20.0, bottom: 15.0),
                          hintText: '14',
                          hintStyle: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Noto Sans',
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Laikas', style: _kTextFieldNameStyle),
                      ],
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Nustatytkite kokiu laiku gersite vaistus',
                            style: _kDescriptionTextStyle),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 15.0, left: 20.0, bottom: 15.0),
                          hintText: '06:00',
                          hintStyle: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Noto Sans',
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Color(0xFF1F49AF).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.clock,
                    color: Color(0xFF1F49AF),
                  ),
                  onPressed: null),
            ),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFF1F49AF),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Center(child: Text('Nustatyti', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
