import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextField extends StatelessWidget {

  final String textlabel;
  final bool obscuretext;
  final EdgeInsets margin;
  final TextEditingController controller;
  


  const CustomTextField( 
    {
      super.key,
      this.margin = const EdgeInsets.only(top: 7, bottom: 7,left: 20,right:20),
      required this.textlabel,
      required this.controller,
      this.obscuretext = false,
    }
    );
    @override


  @override
   Widget build(BuildContext context) {
    return Card
    (
      margin: margin,
      elevation: 6,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container
          (
            margin: const EdgeInsets.only(left: 12, top:8),
            child:Text(
              textlabel,
              style:GoogleFonts.ubuntu(fontSize: 11, fontWeight: FontWeight.w700 ),
              textAlign: TextAlign.left,
              ),
          ),
 
          TextField
          (
          obscureText: obscuretext,
          style:GoogleFonts.ubuntu(color: Color.fromRGBO(98, 98, 98, 1.0),fontSize: 10),
          decoration: 
            InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none,),
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.transparent,
              isDense: true,
              contentPadding: const EdgeInsets.only(top:7,bottom: 9,left:9,right:9)
            ),
          ),
        ]
      )
    );
  }}

