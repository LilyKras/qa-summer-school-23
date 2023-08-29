import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/profile_test_screen.dart';
import '../gherkin_suite_test.dart';
import '../world/contextualWorld.dart';

abstract class ProfileStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю фамилию {string}$'),
          (surname, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            context.world.setContext('surname',surname);
            await tester.enterText(ProfileTestScreen.surnameField, surname);
            await tester.pump();
          },
        ),
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю дату рождения {string}$'),
          (birthdate, context) async {
            final tester = context.world.rawAppDriver;
            context.world.setContext('birthdate', birthdate);

            tester
                .widget<TextField>(ProfileTestScreen.birthdayField)
                .controller
                ?.text = birthdate;
            await tester.pump();
          },
        ),
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю имя {string}$'),
          (name, context) async {
            final tester = context.world.rawAppDriver;
            context.world.setContext('name',name);
            await tester.enterText(ProfileTestScreen.nameField, name);
            await tester.pump();
          },
        ),
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю отчество {string}$'),
          (secondName, context) async {
            final tester = context.world.rawAppDriver;
            context.world.setContext('secondName',secondName);
            await tester.enterText(ProfileTestScreen.secondNameField, secondName);
            await tester.pump();
          },
        ),
    when<ContextualWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(ProfileTestScreen.nextBtn);
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я вижу заполненные поля ФИО$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        final fieldSurname = tester.widget<TextField>(ProfileTestScreen.surnameField);
        final fieldName = tester.widget<TextField>(ProfileTestScreen.nameField);
        final fieldSecondName = tester.widget<TextField>(ProfileTestScreen.secondNameField);
        expect(fieldSurname.controller!.text, context.world.getContext<String>('surname'));
        expect(fieldName.controller!.text, context.world.getContext<String>('name'));
        expect(fieldSecondName.controller!.text, context.world.getContext<String>('secondName'));
        await tester.pump();
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я вижу заполненное поле даты рождения$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        final fieldDate = tester.widget<TextField>(ProfileTestScreen.birthdayField);
        expect(fieldDate.controller!.text, context.world.getContext<String>('birthdate'));
        await tester.pump();
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я перехожу назад$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(ProfileTestScreen.prevBtn);
      },
    ),

      ];
}




