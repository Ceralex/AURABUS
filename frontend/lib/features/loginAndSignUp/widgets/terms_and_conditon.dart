import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Termsandconditon extends StatefulWidget {
  const Termsandconditon({super.key});
  
  @override
  State<StatefulWidget> createState()   => _Termsandconditon();
}

class _Termsandconditon extends State<Termsandconditon>
{
      bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(left: 20,right:30),
    child:Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          Checkbox(value: isChecked, onChanged:(bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
          }),
          
          Expanded(
            child: Text(
            "I Agree with the Terms and Conditions and Privacy Policy",
            style:GoogleFonts.inter(fontSize: 10),)
        ) 
        ],
      )
    );
  }
}

