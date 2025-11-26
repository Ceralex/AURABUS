import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aurabus/features/loginAndSignUp/presentation/signup_page.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/custom_text_field.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/generic_button.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/google_button.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/terms_and_conditions.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/clickable_text.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: child);
  }

  testWidgets('SignupPage shows titles and all input fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrap(const SignupPage()));

    expect(find.text('AURABUS'), findsOneWidget);
    expect(find.text('SignUp'), findsOneWidget);

    // Input fields
    expect(find.byType(CustomTextField), findsNWidgets(5));
    expect(find.text('FIRST NAME'), findsOneWidget);
    expect(find.text('LAST NAME'), findsOneWidget);
    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.text('PASSWORD'), findsOneWidget);
    expect(find.text('CONFIRM PASSWORD'), findsOneWidget);
  });

  testWidgets('SignupPage shows terms, buttons and bottom link', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrap(const SignupPage()));

    // Terms and conditions
    expect(find.byType(TermsAndConditions), findsOneWidget);

    // Buttons
    expect(find.byType(Genericbutton), findsOneWidget);
    expect(find.text('Sign-Up'), findsOneWidget);
    expect(find.byType(Googlebutton), findsOneWidget);

    // Bottom clickable text
    expect(find.text('Do you already have an account? Log in'), findsOneWidget);
    expect(find.byType(Clickabletext), findsWidgets);
  });
}
