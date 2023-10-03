import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:table_calendar/table_calendar.dart';

class WetherPage extends StatefulWidget {
  const WetherPage({super.key});

  @override
  State<WetherPage> createState() => _WetherPageState();
}

class _WetherPageState extends State<WetherPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(axes: [
      RadialAxis(
          showAxisLine: false,
          showLabels: false,
          minimum: 0,
          maximum: 150,
          useRangeColorForAxis: true,
          radiusFactor: 0.8,
          interval: 8,
          minorTicksPerInterval: 2,
          ticksPosition: ElementsPosition.outside,
          ranges: [
            GaugeRange(
              color: Color.fromARGB(255, 3, 71, 231),
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 0,
              endValue: 15,
            ),
            GaugeRange(
              startValue: 15,
              sizeUnit: GaugeSizeUnit.factor,
              endValue: 30,
              color: Color.fromARGB(255, 36, 102, 255),
            ),
            GaugeRange(
              startValue: 30,
              sizeUnit: GaugeSizeUnit.factor,
              endValue: 45,
              color: Color.fromARGB(255, 58, 156, 236),
            ),
            GaugeRange(
              startValue: 45,
              sizeUnit: GaugeSizeUnit.factor,
              endValue: 60,
              color: Color.fromARGB(255, 110, 187, 250),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 60,
              endValue: 70,
              color: Color.fromARGB(255, 243, 192, 5),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 70,
              endValue: 80,
              color: Color.fromARGB(255, 246, 193, 35),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 80,
              endValue: 90,
              color: Color.fromARGB(255, 241, 176, 37),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 90,
              endValue: 95,
              color: Color.fromRGBO(244, 163, 64, 1),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 95,
              endValue: 110,
              color: Color.fromRGBO(231, 82, 13, 1),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 110,
              endValue: 130,
              color: Color.fromARGB(255, 252, 34, 34),
            ),
            GaugeRange(
              sizeUnit: GaugeSizeUnit.factor,
              startValue: 130,
              endValue: 150,
              color: Color.fromARGB(255, 236, 0, 0),
            ),
          ],
          annotations: [
            GaugeAnnotation(
                widget: Container(
                    child: const Text('+23°',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.1)
          ])
    ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    var math;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 6, 55),
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text(
                "Temperature",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.013),
            const Text(
              "London",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w500),
            ),
            _getGauge(),
            TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Colors.white,
                    ),
                    weekendStyle: TextStyle(color: Colors.white)),
                rowHeight: 34,
                calendarStyle: const CalendarStyle(
                    outsideTextStyle: TextStyle(color: Colors.white),
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.white),
                    rangeHighlightColor: Color.fromARGB(11, 3, 149, 253)),
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(color: Colors.white),
                    leftChevronIcon: Icon(
                      Icons.navigate_before_sharp,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 05, 08),
                onDaySelected: _onDaySelected,
                lastDay: DateTime.utc(2030))
          ],
        ),
      ),
    );
  }
}
