import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/terms_and_conditions.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('TermsAndConditions shows checkbox and text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrap(TermsAndConditions(isChecked: false, onChanged: (_) {})),
    );

    expect(find.byType(Checkbox), findsOneWidget);
    expect(
      find.text('I Agree with the Terms and Conditions and Privacy Policy'),
      findsOneWidget,
    );
  });

  testWidgets('TermsAndConditions calls onChanged when checkbox is tapped', (
    WidgetTester tester,
  ) async {
    bool? lastValue;

    await tester.pumpWidget(
      wrap(
        TermsAndConditions(isChecked: false, onChanged: (v) => lastValue = v),
      ),
    );

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(lastValue, isNotNull);
    expect(lastValue, isTrue);
  });
}
