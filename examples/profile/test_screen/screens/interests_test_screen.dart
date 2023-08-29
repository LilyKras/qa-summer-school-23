import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

abstract class InterestsTestScreen {
  /// GestureDetector. Строгое соответствие
  static Finder interestsGestureDetector(String interest) => find.byWidgetPredicate((widget) {

    if (widget is GestureDetector){


      final padding = widget.child;
      if (padding is Padding){

        final row = padding.child;
        if (row is Row && row.children.length == 2) {

          final text = row.children[1];
          if (text is Text){
            if (text.data == interest){
              return true;
            }
          }

        }
      }
    }
    return false;

  });

  static Finder scrollable  = find.byWidgetPredicate((widget) {

    if (widget is ListView){

      return true;

    }
    return false;

  });
  /// кнопка next на экране интересов
  static Finder nextBtn = find.byWidgetPredicate((widget) => widget is ElevatedButton);

  /// кнопка назад
  static Finder prevBtn = GeneralTestScreen.prevBtn;
}

