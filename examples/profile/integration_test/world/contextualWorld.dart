import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/src/finders.dart';
import 'package:flutter_test/src/widget_tester.dart';
import 'package:gherkin/src/gherkin/attachments/attachment_manager.dart';

class ContextualWorld extends FlutterWidgetTesterWorld {
  Map<String, dynamic> scenarioContext = <String, dynamic>{};

  @override
  void dispose() {
    scenarioContext.clear();
  }

  T getContext<T>(String key) {
    return scenarioContext[key] as T;
  }

  void setContext(String key, dynamic value) {
    scenarioContext[key] = value;
  }



}