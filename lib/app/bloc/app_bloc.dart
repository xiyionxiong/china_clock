import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';

class AppBloc extends BlocBase {
  Locale _locale = Locale('zh-CH');

  Locale get locale => _locale;

  set locale(Locale locale) {
    this._locale = locale;
    notifyListeners();
  }
}
