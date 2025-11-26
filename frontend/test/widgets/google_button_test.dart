import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/google_button.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('Googlebutton shows OutlinedButton with Google label', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrap(const Googlebutton(height: 40, width: 120)));

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
  });
}
