import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:china_clock/app/app_module.dart';
import 'package:china_clock/app/bloc/app_bloc.dart';
import 'package:china_clock/app/modules/china_clock.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppBloc>(
        tag: AppModule.to.tag,
        builder: (BuildContext context, AppBloc bloc) => MaterialApp(
              title: 'China Clock',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Color(0xff3d6db4)),
              home: ClockPage(),
              localeResolutionCallback: (deviceLocale, _) => bloc.locale = deviceLocale,
            ));
  }
}
