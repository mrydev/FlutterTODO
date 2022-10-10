import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/utneed/colors.dart';

class TodoBox extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoBox(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: MyColors().hotPink,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: MyColors().pattensBlue,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(taskName,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
