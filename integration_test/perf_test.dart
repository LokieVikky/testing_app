import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_app/main.dart';

void main() {
  group('Testing App Performance', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Scrolling Test', (tester) async {
      await tester.pumpWidget(const TestingApp());

      await binding.traceAction(() async {
        await tester.fling(find.byType(ListView), const Offset(0, -500), 10000);
        await tester.pumpAndSettle();
        await tester.fling(find.byType(ListView), const Offset(0, 500), 10000);
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary');

    });
  });
}
