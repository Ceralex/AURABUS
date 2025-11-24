import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/clickable_text.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('Clickabletext shows label and triggers callback on tap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      wrap(
        Clickabletext(
          textlabel: 'Tap me',
          fun: () {
            tapped = true;
          },
        ),
      ),
    );

    expect(find.text('Tap me'), findsOneWidget);

    await tester.tap(find.text('Tap me'));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
