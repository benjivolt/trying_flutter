import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmax/controllers/subscription_controller.dart';
import 'package:skillmax/main.dart';

class TestSubscriptionController extends SubscriptionController {
  int restoreCalls = 0;

  @override
  Future<void> init({String? appUserId}) async {}

  @override
  Future<void> restorePurchases() async {
    restoreCalls += 1;
    state = state.copyWith(isPremium: true);
  }
}

void main() {
  testWidgets('restoring purchases updates the entitlement shown on screen',
      (tester) async {
    final controller = TestSubscriptionController();
    await tester.pumpWidget(ProviderScope(
      overrides: [
        subscriptionControllerProvider.overrideWith(() => controller),
      ],
      child: const SkillMaxApp(),
    ));
    await tester.pump();

    expect(find.text('SkillMax'), findsOneWidget);
    expect(find.text('Premium: INACTIVE'), findsOneWidget);

    await tester.tap(find.text('Restore Purchases'));
    await tester.pump();

    expect(controller.restoreCalls, 1);
    expect(find.text('Premium: ACTIVE'), findsOneWidget);
    expect(find.text('Premium: INACTIVE'), findsNothing);
  });
}
