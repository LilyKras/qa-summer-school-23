import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:profile/runner.dart' as app;
import 'package:surf_logger/surf_logger.dart';

import '../test_screen/screens/interests_test_screen.dart';
import 'step_definitions/aboutMe_step_definitions.dart';
import 'step_definitions/interests_step_definitions.dart';
import 'step_definitions/main_step_definitions.dart';
import 'step_definitions/place_step_definitions.dart';
import 'step_definitions/profile_step_definitions.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      featureDefaultLanguage: 'ru',
      order: ExecutionOrder.alphabetical,
      defaultTimeout: const Duration(minutes: 5),
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(Logger.d)
          ..setWriteFn(Logger.d),
        ProgressReporter()
          ..setWriteLineFn(Logger.d)
          ..setWriteFn(Logger.d),
        TestRunSummaryReporter()
          ..setWriteLineFn(Logger.d)
          ..setWriteFn(Logger.d),
        JsonReporter(writeReport: (_, __) => Future<void>.value()),
      ],
      stepDefinitions: [
        ...MainStepDefinitions.steps,
        ...ProfileStepDefinitions.steps,
        ...PlaceStepDefinitions.steps,
        ...InterestsStepDefinitions.steps,
        ...AboutMeStepDefinitions.steps,
        ...MainStepDefinitions.steps,
        ...CheckProfileStepDefinitions.steps,
        ...CheckPlaceStepDefinitionsStepDefinitions.steps,
        ...CheckInterestsStepDefinitions.steps,
        ...CheckAboutMeStepDefinitions.steps,
      ],
    ),
    appMainFunction: (world) => app.run(),
  );
}
