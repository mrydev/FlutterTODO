import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.secondary,
      child: Text(
        text,
        style:
            GoogleFonts.inter(textStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
