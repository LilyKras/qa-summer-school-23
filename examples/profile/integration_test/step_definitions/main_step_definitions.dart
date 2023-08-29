import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import '../../test_screen/test_screen_library.dart';
import '../world/contextualWorld.dart';
import 'pupUntil_function.dart';

abstract class MainStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when<ContextualWorld>(
          RegExp(r'Я перехожу к редактированию профиля$'),
          (context) async {

            final tester = context.world.rawAppDriver;
            await tester.pumpUntilVisible(MainTestScreen.editProfileBtn);
            await tester.tap(MainTestScreen.editProfileBtn);
          },
        ),
      ];
}
