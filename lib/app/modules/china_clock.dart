import 'dart:async';

import 'package:battery/battery.dart';
import 'package:china_clock/app/shared/widget/lunar.dart';
import 'package:china_clock/app/shared/widget/week.dart';
import 'package:china_clock/app/shared/widget/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pedometer/pedometer.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

final Color baseColor = Color(0xff1f499d);

class _ClockPageState extends State<ClockPage> {
  Timer _timer;
  Timer _timerPedometer;
  int step = 0;
  int batteryLevel = 100;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
    // every 10 minutes to get  pedometer
    _timerPedometer = Timer(Duration(minutes: 10), () {
      Pedometer().pedometerStream.listen((_count) {
        this.setState(() {
          step = _count;
        });
      }, onError: (e) {});
    });
    Battery().batteryLevel.then((value) {
      this.setState(() {
        batteryLevel = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer.cancel();
    if (_timerPedometer != null) _timerPedometer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now().toUtc().toLocal();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 350,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 12,
                    bottom: 100,
                    child: Image.asset(
                      'assets/images/left.png',
                      height: 120,
                      color: baseColor,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            WordWidget(
                              title: date.hour,
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: 42, color: baseColor),
                            ),
                            WordWidget(
                              title: date.minute,
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: 42, color: baseColor),
                            ),
                            WordWidget(
                              title: date.second,
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: <Widget>[
                            Text(
                              '${date.year}',
                              style: TextStyle(color: baseColor, fontSize: 18),
                            ),
                            Text(
                              '/${date.month}',
                              style: TextStyle(color: baseColor, fontSize: 18),
                            ),
                            Text(
                              '/${date.day}',
                              style: TextStyle(color: baseColor, fontSize: 18),
                            ),
                            SizedBox(width: 6),
                            WeekWidget(
                              title: date.weekday,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
//                  Consumer<AppBloc>(
//                    tag: AppModule.to.tag,
//                    builder: (BuildContext context, AppBloc value) {
////                      print('value.locale.languageCode=${value.locale.languageCode}');
//                      if (value.locale.languageCode == 'ch') {
//                        return Positioned(bottom: 140, left: 84, child: LunarWidget(date: date));
//                      }
//                      return Container();
//                    },
//                  ),
                  Positioned(bottom: 140, left: 84, child: LunarWidget(date: date)),
                  Positioned(
                    bottom: 110,
                    left: 84,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          ImageIcon(AssetImage('assets/images/footprint.png'), color: baseColor, size: 18),
                          SizedBox(width: 2),
                          Text(
                            '$step',
                            style: TextStyle(color: baseColor, fontSize: 14),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.battery_std, color: baseColor, size: 18),
                          Text(
                            '$batteryLevel%',
                            style: TextStyle(color: baseColor, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(350 / 2)),
                boxShadow: [
                  BoxShadow(color: Color(0xff8abcd1), offset: Offset(4.0, 4.0), blurRadius: 15.0, spreadRadius: 1.0),
                  BoxShadow(color: Theme.of(context).primaryColor, offset: Offset(-1.0, -1.0), blurRadius: 15.0, spreadRadius: 1.0),
                ],
                image: DecorationImage(image: AssetImage('assets/images/pan_new.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
