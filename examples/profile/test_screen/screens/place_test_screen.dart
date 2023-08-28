import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

abstract class PlaceTestScreen {
  /// поле Surname на экране места
  static Finder placeField = GeneralTestScreen.textField('Place of residence');

  /// кнопка next на экране места
  static Finder nextBtn = GeneralTestScreen.nextBtn;
}
