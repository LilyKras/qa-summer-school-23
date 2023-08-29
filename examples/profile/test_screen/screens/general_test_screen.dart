import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class GeneralTestScreen {
  /// текстовое поле [TextField] по подсказке или хинту [hint]. Строгое соответствие
  static Finder textField(String hint) => find.byWidgetPredicate((widget) {
        return widget is TextField &&
            ((widget.decoration?.labelText == hint) ||
                (widget.decoration?.hintText == hint));
      });
  ///кнопка далее
  static Finder nextBtn =
  find.byIcon(Icons.navigate_next);

  ///кнопка назад
  static Finder prevBtn = find.byWidgetPredicate((widget) => widget is BackButton);


}