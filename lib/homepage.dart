import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date = DateTime.now();

  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 6.5);
    final barGroup3 = makeGroupData(2, 5);
    final barGroup4 = makeGroupData(3, 7.5);
    final barGroup5 = makeGroupData(4, 9);
    final barGroup6 = makeGroupData(5, 11.5);
    final barGroup7 = makeGroupData(6, 6.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f3f4),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(color: Colors.blue[800]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FlChart(
                chart: BarChart(BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: TouchTooltipData(
                        tooltipBgColor: Colors.blueGrey,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((touchedSpot) {
                            String weekDay;
                            switch (touchedSpot.spot.x.toInt()) {
                              case 0: weekDay = 'Monday'; break;
                              case 1: weekDay = 'Tuesday'; break;
                              case 2: weekDay = 'Wednesday'; break;
                              case 3: weekDay = 'Thursday'; break;
                              case 4: weekDay = 'Friday'; break;
                              case 5: weekDay = 'Saturday'; break;
                              case 6: weekDay = 'Sunday'; break;
                            }
                            return TooltipItem(weekDay + '\n' + touchedSpot.spot.y.toString(), TextStyle(color: Colors.yellow));
                          }).toList();
                        }
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                        showTitles: true,
                        textStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        margin: 16,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'M';
                            case 1:
                              return 'T';
                            case 2:
                              return 'W';
                            case 3:
                              return 'T';
                            case 4:
                              return 'F';
                            case 5:
                              return 'S';
                            case 6:
                              return 'S';
                          }
                        }
                    ),
                    leftTitles: SideTitles(showTitles: false,),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${DateFormat('EEEE').format(date)}, ${date.month}.${date.day}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Center(
                      child: Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                    size: 14.0,
                  )),
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Image(
                                image: AssetImage('images/pill.png'),
                                height: 40.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //TODO: Add a dynamic name of the pills
                                        Text(
                                          'Ibuprofen',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Lato'),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0, horizontal: 8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[600],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Text(
                                            '11:00',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '2 x 50 mg',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Lato',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 6.0),
                                          child: Text(
                                            '-00:18',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Lato',
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
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.0,
                  );
                },
                itemCount: 2,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BtmNavBar(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: barColor,
        width: width,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: 20,
          color: barBackgroundColor,
        ),
      ),
    ]);
  }
}

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


