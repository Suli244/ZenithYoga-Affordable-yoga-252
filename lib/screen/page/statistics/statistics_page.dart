import 'dart:math';

import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Widget bottomTitleWidgets(double value, TitleMeta meta) {
//   String text;
//   switch (value.toInt()) {
//     case 0:
//       text = 'Mon';
//       break;
//     case 1:
//       text = 'Tue';
//       break;
//     case 2:
//       text = 'Wed';
//       break;
//     case 3:
//       text = 'Thu';
//       break;
//     case 4:
//       text = 'Fri';
//       break;
//     case 5:
//       text = 'Sat';
//       break;
//     case 6:
//       text = 'Sun';
//       break;
//     default:
//       text = '';
//       break;
//   }

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<Color> gradientColors = [
    const Color(0xffCC2FDA),
    const Color(0xffCC2FDA),
  ];
  int indexChart = 1;
  bool showAvg = false;

  List<List<LoganXManChelovek>> result = [];
  List<FlSpot> days = [FlSpot(0.5, Random().nextDouble() * 5 + 1)];
  List<FlSpot> weeks = [FlSpot(0.5, Random().nextDouble() * 5 + 1)];
  List<FlSpot> months = [FlSpot(0.5, Random().nextDouble() * 5 + 1)];
  late Box<LoganXManChelovek> box;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    await initBox();
    getNotes();
    initFlSpot();
  }

  initFlSpot() async {
    final noterModel = box.values.toList();
    if (noterModel.isNotEmpty) {
      DateTime today = DateTime.now();
      DateTime monday = today.subtract(Duration(days: today.weekday - 1));
      DateTime sunday = today.add(Duration(days: 7 - today.weekday));
      for (var element in noterModel) {
        if (element.dateTime.day == today.day) {
          days.add(FlSpot(
              element.dateTime.hour.toDouble() +
                  (element.dateTime.minute.toDouble() / 100),
              Random().nextDouble() * 5 + 1));
        }
        if (element.dateTime
                .isAfter(monday.subtract(const Duration(days: 1))) &&
            element.dateTime.isBefore(sunday.add(const Duration(days: 1)))) {
          weeks.add(FlSpot(element.dateTime.weekday.toDouble(),
              Random().nextDouble() * 5 + 1));
        }
        if (element.dateTime.month == today.month) {
          months.add(FlSpot(
              element.dateTime.day.toDouble(), Random().nextDouble() * 5 + 1));
        }
      }
      print('days $days weeks $weeks months $months');
    }
  }

  Future initBox() async {
    if (Hive.isBoxOpen('karakol')) {
      box = Hive.box<LoganXManChelovek>('karakol');
    } else {
      box = await Hive.openBox<LoganXManChelovek>('karakol');
    }

    return box;
  }

  getNotes() async {
    final noterModel = box.values.toList();
    if (noterModel.isNotEmpty) {
      Map<String, List<LoganXManChelovek>> groupedItems = {};

      for (var item in noterModel) {
        if (groupedItems.containsKey(item.group)) {
          groupedItems[item.group]!.add(item);
        } else {
          if (item.group != null) {
            groupedItems[item.group!] = [item];
          }
        }
      }

      result = groupedItems.values.toList();

      // Выводим результат
      for (var sublist in result) {
        print(sublist);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: initBox(),
          builder: (context, snapShot) {
            print('snapShot.connectionState ${snapShot.connectionState}');
            if (snapShot.connectionState == ConnectionState.done) {
              return ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, value, child) {
                    // getNotes();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 16),
                            const Text(
                              'Statistics',
                              style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff0D0F45)),
                            ),
                            const SizedBox(height: 24),
                            AspectRatio(
                              aspectRatio: 2,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Calories Statistics',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff5C5E8B)),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              indexChart = 0;
                                            });
                                          },
                                          child: Text(
                                            'Daily',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: indexChart == 0
                                                    ? const Color(0xffA65EEF)
                                                    : const Color(0xff5C5E8B)),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              indexChart = 1;
                                            });
                                          },
                                          child: Text(
                                            'Weekly',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: indexChart == 1
                                                    ? const Color(0xffA65EEF)
                                                    : const Color(0xff5C5E8B)),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              indexChart = 2;
                                            });
                                          },
                                          child: Text(
                                            'Monthly',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: indexChart == 2
                                                    ? const Color(0xffA65EEF)
                                                    : const Color(0xff5C5E8B)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 22),
                                    Expanded(
                                      child: result.isEmpty
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'assets/images/statistic_icon.png'),
                                                const SizedBox(width: 12),
                                                const Expanded(
                                                  child: Text(
                                                      'You haven\'t done yoga or meditation yet. So we can\'t count calories, do any of these things to get statistics.',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff5C5E8B),
                                                        fontSize: 15,
                                                      )),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  '22,634.45 kcal',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffCC2FDA)),
                                                ),
                                                const SizedBox(height: 8),
                                                Expanded(
                                                  child: LineChart(
                                                    indexChart == 0
                                                        ? day()
                                                        : indexChart == 1
                                                            ? week()
                                                            : month(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Latest Practices',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff5C5E8B),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 12),
                            result.isEmpty
                                ? Container(
                                    margin: EdgeInsets.only(top: 100.h),
                                    child: const Center(
                                      child: Text(
                                        'Latest Practices',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff5C5E8B),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        // onTap: () => Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         MeditationDetailPage(katalizator: katalizator),
                                        //   ),
                                        // ),
                                        child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.white,
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  result[index][0].mainImage!,
                                                  fit: BoxFit.cover,
                                                  height: 81,
                                                  width: 81,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Flexible(
                                                child: FittedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        result[index][0].group!,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.h),
                                                      Text(
                                                        '${result[index].length} Sessions',
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 12),
                                    itemCount: result.length,
                                  ),
                            const SizedBox(height: 24)
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const SizedBox();
          }),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff5C5E8B),
      fontSize: 12,
    );
    Widget text;
    switch (value) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Tue', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 4:
        text = const Text('Thu', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 6:
        text = const Text('Sat', style: style);
        break;
      case 7:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget bottomTitleWidgetsMonth(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff5C5E8B),
      fontSize: 12,
    );
    Widget text;
    switch (value) {
      case 1:
        text = const Text('1', style: style);
        break;
      case 5:
        text = const Text('5', style: style);
        break;
      case 10:
        text = const Text('10', style: style);
        break;
      case 15:
        text = const Text('15', style: style);
        break;
      case 20:
        text = const Text('20', style: style);
        break;
      case 25:
        text = const Text('25', style: style);
        break;
      case 30:
        text = const Text('30', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget bottomTitleWidgetsDay(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff5C5E8B),
      fontSize: 12,
    );
    Widget text;
    switch (value) {
      case 1:
        text = const Text('00:00', style: style);
        break;
      case 5:
        text = const Text('04:00', style: style);
        break;
      case 9:
        text = const Text('08:00', style: style);
        break;
      case 13:
        text = const Text('12:00', style: style);
        break;
      case 17:
        text = const Text('16:00', style: style);
        break;
      case 21:
        text = const Text('20:00', style: style);
        break;
      case 25:
        text = const Text('24:00', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData month() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: bottomTitleWidgetsMonth,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 0,
          ),
        ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: const Color(0xff37434d)),
      // ),
      minX: 0.5,
      maxX: 30.5,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: months,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffA266A7).withOpacity(0.19),
                const Color(0xffA266A7).withOpacity(0)
              ],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData week() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 0,
          ),
        ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: const Color(0xff37434d)),
      // ),
      minX: 0.5,
      maxX: 7.5,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: weeks,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffA266A7).withOpacity(0.19),
                const Color(0xffA266A7).withOpacity(0)
              ],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData day() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.amber,
            strokeWidth: 1,
          );
        },
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: bottomTitleWidgetsDay,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 0,
          ),
        ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: const Color(0xff37434d)),
      // ),
      minX: 0.5,
      maxX: 25.5,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: days,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffA266A7).withOpacity(0.19),
                const Color(0xffA266A7).withOpacity(0)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
