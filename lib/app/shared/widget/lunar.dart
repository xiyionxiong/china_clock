import 'package:china_clock/app/modules/china_clock.dart';
import 'package:china_clock/app/shared/util/lunar/lunar_solar_converter.dart';
import 'package:flutter/material.dart';

class LunarWidget extends StatelessWidget {
  final DateTime date;

  const LunarWidget({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Solar solar = Solar(solarYear: date.year, solarMonth: date.month, solarDay: date.day);
    Lunar lunar = LunarSolarConverter.solarToLunar(solar);
    return Container(
      child: Text(
        '$lunar',
        style: TextStyle(color: baseColor, fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
