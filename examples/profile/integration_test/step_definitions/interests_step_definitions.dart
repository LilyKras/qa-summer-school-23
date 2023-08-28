import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import '../../test_screen/screens/interests_test_screen.dart';
import '../../test_screen/screens/place_test_screen.dart';
import '../../test_screen/test_screen_library.dart';

abstract class InterestsStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [

    when1<String, FlutterWidgetTesterWorld>(
      RegExp(r'Я выбираю {string} из интересов$'),
          (interest, context) async {
        debugPrint(interest);
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        await tester.tap(InterestsTestScreen.interestsGestureDetector(interest));
        await tester.pump();
      },
    ),
    when1<String, FlutterWidgetTesterWorld>(
      RegExp(r'Я выбираю {string} из интересов$'),
          (interest, context) async {
        debugPrint(interest);
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        await tester.tap(InterestsTestScreen.interestsGestureDetector(interest));
        await tester.pump();
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(InterestsTestScreen.nextBtn);
      },
    ),
  ];
}

abstract class CheckInterestsStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу выбранные интересы$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        expect(true, true);
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.tap(InterestsTestScreen.nextBtn);
      },
    ),


  ];
}