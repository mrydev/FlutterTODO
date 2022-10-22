import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/utneed/colors.dart';

class TodoBox extends StatefulWidget {
  final String taskName;

  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoBox(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  State<TodoBox> createState() => _TodoBoxState();
}

class _TodoBoxState extends State<TodoBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: MyColors().blue,
          )
        ]),
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              AlertDialog alert = AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                backgroundColor: MyColors().purple,
                content: SizedBox(
                  height: 120,
                  width: 360,
                  child: Center(
                    child: Text(widget.taskName, style: GoogleFonts.inter()),
                  ),
                ),
              );

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            });
            // ignore: avoid_print
            print("${widget.taskName}        Çalışıyo bura");
          },
          onTap: () {
            setState(() {
              widget.taskCompleted = widget.taskCompleted ? false : true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: MyColors().purple,
                borderRadius: BorderRadius.circular(22)),
            child: Row(
              children: [
                Checkbox(
                  value: widget.taskCompleted,
                  onChanged: widget.onChanged,
                  checkColor: Colors.white,
                  activeColor: MyColors().blue,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(widget.taskName,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: widget.taskCompleted
                                  ? Colors.grey.shade800
                                  : Colors.black,
                              decoration: widget.taskCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
