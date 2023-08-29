import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import '../../test_screen/screens/interests_test_screen.dart';
import '../world/contextualWorld.dart';
import 'pupUntil_function.dart';

abstract class InterestsStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [

    when1<String, ContextualWorld>(
      RegExp(r'Я выбираю {string} из интересов$'),
          (interest, context) async {
        debugPrint(interest);
        final tester = context.world.rawAppDriver;
        context.world.setContext('interest', interest);
        await tester.implicitTap(InterestsTestScreen.interestsGestureDetector(interest));
      },
    ),
    when1<String, ContextualWorld>(
      RegExp(r'Я перевыбираю {string} из интересов$'),
          (interest, context) async {
        debugPrint(interest);
        final tester = context.world.rawAppDriver;
        await tester.implicitTap(InterestsTestScreen.interestsGestureDetector(interest));
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.implicitTap(InterestsTestScreen.nextBtn);
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я вижу выбранные интересы$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(InterestsTestScreen.scrollable);
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я перехожу назад$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.implicitTap(InterestsTestScreen.prevBtn);
      },
    ),
  ];
}

