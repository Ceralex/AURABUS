import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Textfield extends StatefulWidget {

  final String textlabel;
  final bool obscuretext;
  final bool marginRight;
  final bool marginLeft;
  


  const Textfield( 
    {
      super.key,
      required this.textlabel,
      this.obscuretext = false,
      this.marginRight = true ,
      this.marginLeft  = true ,
    }
    );

 
  
  @override
  State<StatefulWidget> createState()   => _Textfieldstate();
}

class _Textfieldstate extends State<Textfield>
{
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose(); 
    super.dispose();
  }

  @override
   Widget build(BuildContext context) {
    return Card
    (
      margin: EdgeInsets.only(
        left: widget.marginLeft ? 20 : 5,
        right: widget.marginRight ? 20 : 5,
        top: 7,
        bottom: 7,
      ),


      elevation: 6,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container
          (
            margin: const EdgeInsets.only(left: 12, top:8),
            child:Text(
              widget.textlabel,
              style:GoogleFonts.ubuntu(fontSize: 11, fontWeight: FontWeight.w700 ),
              textAlign: TextAlign.left,
              ),
          ),
 
          TextField
          (
          obscureText: widget.obscuretext,
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
  }
}

