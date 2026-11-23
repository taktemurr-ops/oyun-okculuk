import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_okculuk/oyun_okculuk.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(okculukConfig.title.length, 33);
    expect(okculukConfig.tagline.length, 33);
    for (final s in okculukConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(okculukRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: okculukId, optionalMechanics: okculukRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(okculukRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
