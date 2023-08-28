import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/aboutMe_test_screen.dart';
import '../../test_screen/screens/interests_test_screen.dart';

abstract class AboutMeStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
    when1<String, FlutterWidgetTesterWorld>(
      RegExp(r'Я заполняю заметку о себе {string}$'),
          (text, context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        tester
            .widget<TextField>(AboutMeTestScreen.textField)
            .controller
            ?.text = text;
        await tester.pump();
      },
    ),

    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я сохраняю данные$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(AboutMeTestScreen.saveBtn);
      },
    ),

  ];
}

abstract class CheckAboutMeStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненное поле заметки о себе$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();

        final fieldAboutMe = tester.widget<TextField>(AboutMeTestScreen.textField);
        expect(fieldAboutMe.controller!.text, 'Тестовая заметка о себе');
        await tester.pump();
      },
    ),

  ];
}