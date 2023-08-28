import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

abstract class ProfileTestScreen {
  /// поле Surname на экране персональных данных
  static Finder surnameField = GeneralTestScreen.textField('Surname');

  /// поле Birthday на экране персональных данных
  static Finder birthdayField = GeneralTestScreen.textField('Birthday');

   /// поле name на экране персональных данных
  static Finder nameField = GeneralTestScreen.textField('Name');

   /// поле second name на экране персональных данных
  static Finder secondNameField = GeneralTestScreen.textField('SecondName');

  /// кнопка next на экране персональных данных
  static Finder nextBtn = GeneralTestScreen.nextBtn;
}
