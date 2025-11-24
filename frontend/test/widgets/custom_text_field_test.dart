import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/custom_text_field.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('CustomTextField shows its label', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      wrap(CustomTextField(textlabel: 'EMAIL', controller: controller)),
    );

    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('CustomTextField respects obscuretext flag', (
    WidgetTester tester,
  ) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      wrap(
        CustomTextField(
          textlabel: 'PASSWORD',
          controller: controller,
          obscuretext: true,
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });
}
