import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/aboutMe_test_screen.dart';
import '../world/contextualWorld.dart';
import 'pupUntil_function.dart';

abstract class AboutMeStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [

    when1<String, ContextualWorld>(
      RegExp(r'Я заполняю заметку о себе {string}$'),
          (text, context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(AboutMeTestScreen.textField);
        tester
            .widget<TextField>(AboutMeTestScreen.textField)
            .controller
            ?.text = text;

      },
    ),

    when<ContextualWorld>(
      RegExp(r'Я сохраняю данные$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(AboutMeTestScreen.saveBtn);
        await tester.tap(AboutMeTestScreen.saveBtn);
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я вижу заполненное поле заметки о себе$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(AboutMeTestScreen.textField);

        final fieldAboutMe = tester.widget<TextField>(AboutMeTestScreen.textField);
        expect(fieldAboutMe.controller!.text, 'Тестовая заметка о себе');
        await tester.pump();
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я перехожу назад$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(AboutMeTestScreen.prevBtn);
        await tester.tap(AboutMeTestScreen.prevBtn);
      },
    ),
  ];
}

