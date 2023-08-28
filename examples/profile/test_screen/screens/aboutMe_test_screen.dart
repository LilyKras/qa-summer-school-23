import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

abstract class AboutMeTestScreen {
  /// поле Surname на экране места
  static Finder textField = GeneralTestScreen.textField('Write a few words about yourself');

  /// кнопка save на экране места
  static Finder saveBtn = find.byWidgetPredicate((widget) {
    return widget is ElevatedButton;
  });
}