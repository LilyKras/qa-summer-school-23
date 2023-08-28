import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/profile_test_screen.dart';

abstract class ProfileStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю фамилию {string}$'),
          (surname, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.surnameField, surname);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю дату рождения {string}$'),
          (birthdate, context) async {
            final tester = context.world.rawAppDriver;

            tester
                .widget<TextField>(ProfileTestScreen.birthdayField)
                .controller
                ?.text = birthdate;
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю имя {string}$'),
          (name, context) async {
            final tester = context.world.rawAppDriver;

            await tester.enterText(ProfileTestScreen.nameField, name);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю отчество {string}$'),
          (secondName, context) async {
            final tester = context.world.rawAppDriver;

            await tester.enterText(ProfileTestScreen.secondNameField, secondName);
            await tester.pump();
          },
        ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(ProfileTestScreen.nextBtn);
      },
    ),

      ];
}

abstract class CheckProfileStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненные поля ФИО$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        final fieldSurname = tester.widget<TextField>(ProfileTestScreen.surnameField);
        final fieldName = tester.widget<TextField>(ProfileTestScreen.nameField);
        final fieldSecondName = tester.widget<TextField>(ProfileTestScreen.secondNameField);
        expect(fieldSurname.controller!.text, 'Semenikhina');
        expect(fieldName.controller!.text, 'Daria');
        expect(fieldSecondName.controller!.text, 'Evgenevna');
        await tester.pump();
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненное поле даты рождения$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        final fieldDate = tester.widget<TextField>(ProfileTestScreen.birthdayField);
        expect(fieldDate.controller!.text, '1998-11-14');
        await tester.pump();
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(ProfileTestScreen.nextBtn);
      },
    ),

  ];
}


