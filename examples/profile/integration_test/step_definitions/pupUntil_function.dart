import 'package:flutter_test/flutter_test.dart';

const _defaultPumpTimeout = Duration(minutes: 5);

const _minimalPumpDelay = Duration(milliseconds: 50);
const _minimalInteractionDelay = Duration(milliseconds: 500);

extension PumpExtendedWidgetTester on WidgetTester{

  /// Функция для pump пока не будет обнаружен Widget
  Future<bool> pumpUntilVisible(Finder target,
      {Duration timeout = _defaultPumpTimeout, bool doThrow = true,}) async {
    bool condition() =>
        target
            .evaluate()
            .isNotEmpty;
    final found = await pumpUntilCondition(condition, timeout: timeout);
    // ignore: only_throw_errors
    if (!found && doThrow) {
      throw TestFailure(
        'Target was not found ${target.toString()}',);
    }
    return found;
  }

  /// Метод для того, чтобы делать pump, пока не произойдет условие [condition]
  Future<bool> pumpUntilCondition(bool Function() condition,
      {Duration timeout = _defaultPumpTimeout,}) async {
    final times = (timeout.inMicroseconds / _minimalPumpDelay.inMicroseconds)
        .ceil();
    for (var i = 0; i < times; i++) {
      if (condition()) {
        await pumpForDuration(_minimalInteractionDelay);
        return true;
      }
      await pump(_minimalPumpDelay);
    }
    return false;
  }

  Future<bool> pumpForDuration(
      Duration duration,) async {
    await pump(duration);
    return false;
  }

}