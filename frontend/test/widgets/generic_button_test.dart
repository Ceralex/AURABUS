import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/generic_button.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(body: SizedBox(width: 300, height: 200, child: child)),
    );
  }

  testWidgets('Genericbutton shows correct label and is a TextButton', (
    WidgetTester tester,
  ) async {
    const label = 'Login';

    await tester.pumpWidget(wrap(const Genericbutton(textlabel: label)));

    expect(find.text(label), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });

  testWidgets('Genericbutton uses fixed height (45)', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrap(const Genericbutton(textlabel: 'Test')));

    final container = tester.widget<Container>(find.byType(Container).first);
    final constraints = container.constraints;

    expect(constraints?.minHeight, 45);
    expect(constraints?.maxHeight, 45);
  });
}
