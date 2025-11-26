import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aurabus/features/loginAndSignUp/presentation/login_page.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/custom_text_field.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/generic_button.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/clickable_text.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: child);
  }

  testWidgets('LoginPage shows titles and fields', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const LoginPage()));

    // Header texts
    expect(find.text('AURABUS'), findsOneWidget);
    expect(find.text('LogIn'), findsOneWidget);

    // CustomTextField widgets
    expect(find.byType(CustomTextField), findsNWidgets(2));
    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.text('PASSWORD'), findsOneWidget);

    // Genericbutton
    expect(find.byType(Genericbutton), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('LoginPage shows clickable helper texts', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrap(const LoginPage()));

    // "forgot your password?"
    expect(find.text('forgot your password?'), findsOneWidget);

    // Bottom clickable text
    expect(find.text("Don't have an account? Sign up"), findsOneWidget);

    // There should be at least two Clickabletext widgets
    expect(find.byType(Clickabletext), findsNWidgets(2));
  });
}
