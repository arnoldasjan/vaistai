import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'bottomnavigationbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var date = DateTime.now();

  final Color barColor = Color(0xFF0DA0E2);
  final Color barBackgroundColor = const Color(0xff1C45A6);
  final double width = 8;

  StreamController<LineTouchResponse> controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = StreamController();
    controller.stream.distinct().listen((LineTouchResponse response) {
      print('response: ${response.touchInput}');
    });
  }

  List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f3f4),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: 30.0, right: 20.0, top: 50.0, bottom: 10.0),
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(color: Color(0xFF1F49AF)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '5 748 ',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              ' steps',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Text(
                          '4.9 km',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '1000  kcal',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AspectRatio(
                  aspectRatio: 2.0,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, top: 24, bottom: 12),
                      child: FlChart(
                        chart: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              touchResponseSink: controller.sink,
                              touchTooltipData: TouchTooltipData(
                                tooltipBgColor:
                                    Colors.black,
                              ),
                            ),
                            gridData: FlGridData(
                              show: false,
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 15,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return 'P';
                                    case 1:
                                      return 'A';
                                    case 2:
                                      return 'T';
                                    case 3:
                                      return 'K';
                                    case 4:
                                      return 'Pn';
                                    case 5:
                                      return 'Š';
                                    case 6:
                                      return 'S';
                                  }

                                  return '';
                                },
                                margin: 12,
                              ),
                              leftTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            borderData: FlBorderData(
                                show: false,
                                border: Border.all(
                                    color: Color(0xff37434d), width: 1)),
                            minX: 0,
                            maxX: 6,
                            minY: 0,
                            maxY: 6,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 3),
                                  FlSpot(1, 2),
                                  FlSpot(2, 5),
                                  FlSpot(3, 3.1),
                                  FlSpot(4, 4),
                                  FlSpot(5, 3),
                                  FlSpot(6, 4),
                                ],
                                isCurved: true,
                                colors: gradientColors,
                                barWidth: 5,
                                isStrokeCapRound: true,
                                dotData: FlDotData(
                                  show: true,
                                ),
                                belowBarData: BelowBarData(
                                  show: true,
                                  colors: gradientColors
                                      .map((color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
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
                                              fontWeight: FontWeight.bold,
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
                                              const EdgeInsets.only(right: 8.0),
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
                itemCount: 3,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BtmNavBar(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.close();
  }
}


