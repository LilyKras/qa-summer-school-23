import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/place_test_screen.dart';
import '../world/contextualWorld.dart';
import 'pupUntil_function.dart';

abstract class PlaceStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
    when1<String, ContextualWorld>(
      RegExp(r'Я выбираю город {string}$'),
          (place, context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(PlaceTestScreen.placeField);
        tester
            .widget<TextField>(PlaceTestScreen.placeField)
            .controller
            ?.text = place;
      },
    ),

    when<ContextualWorld>(
      RegExp(r'Я перехожу далее$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(PlaceTestScreen.nextBtn);
        await tester.tap(PlaceTestScreen.nextBtn);
      },
    ),
    when<ContextualWorld>(

      RegExp(r'Я вижу заполненное поле города$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(PlaceTestScreen.placeField);
        final fieldPlace = tester.widget<TextField>(PlaceTestScreen.placeField);
        expect(fieldPlace.controller!.text, 'Voronezh');
      },
    ),
    when<ContextualWorld>(
      RegExp(r'Я перехожу назад$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpUntilVisible(PlaceTestScreen.prevBtn);
        await tester.tap(PlaceTestScreen.prevBtn);
      },
    ),

  ];
}


