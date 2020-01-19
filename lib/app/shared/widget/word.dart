import 'package:china_clock/app/modules/china_clock.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {
  final int title;

  const WordWidget({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: theme.primaryColor.withOpacity(0.2),
      ),
      width: 60,
      child: Center(
        child: Text(
          title < 10 ? '0$title' : '$title',
          style: TextStyle(color: baseColor, fontSize: 42),
        ),
      ),
    );
  }
}
