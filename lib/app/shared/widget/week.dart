import 'package:flutter/material.dart';

final List<String> week = [
  '星期一',
  '星期二',
  '星期三',
  '星期四',
  '星期五',
  '星期六',
  '星期日',
];

class WeekWidget extends StatelessWidget {
  final int title;

  const WeekWidget({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: theme.primaryColor,
      ),
      width: 60,
      child: Center(
        child: Text(
          '${week[title - 1]}',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
