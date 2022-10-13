import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/utils/buttonut.dart';
import 'package:todoapp/utneed/colors.dart';

class AlertBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  AlertBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors().pattensBlue,
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        width: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Planlanmış bir görev ekle.",
                  hintStyle: GoogleFonts.inter()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onPressed: onSave,
                  text: "Kaydet",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: MyButton(onPressed: onCancel, text: "İptal"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
