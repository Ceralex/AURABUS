import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  const TermsAndConditions({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: isChecked, onChanged: onChanged),

          Expanded(
            child: Text(
              "I Agree with the Terms and Conditions and Privacy Policy",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
