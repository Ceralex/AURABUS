import 'package:aurabus/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Termsandconditon extends StatelessWidget {
  const Termsandconditon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right:30),
    child:Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          Checkbox(value: false, onChanged:(bool? value) {context.go(AppRoute.login);},),
          Expanded(
            child: Text(
            "I Agree with the Terms and Conditions and Privacy Policy",
            style:GoogleFonts.inter(fontSize: 10),)
        )
        ],
      ));

  }
}

