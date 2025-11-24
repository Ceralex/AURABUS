import 'package:flutter/material.dart';

class Genericbutton extends StatelessWidget {

  final String textlabel;
  const Genericbutton( 
    {super.key,
    required this.textlabel,}
    );

  @override
  Widget build(BuildContext context) {
    return Container
    (
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: double.infinity,
      height: 45,
      child:TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).primaryColor,
          ),
        onPressed: () { },
        child: Text(
          textlabel,
            style:TextStyle(fontSize: 11, fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.onPrimary ),
        ),
      )
    );
  }
}

