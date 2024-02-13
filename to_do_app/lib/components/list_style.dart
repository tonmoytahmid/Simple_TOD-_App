import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListStyle extends StatelessWidget {
  final String text;
  final bool value;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetodo;

  ListStyle(
      {super.key,
      required this.text,
      required this.value,
      required this.onChanged,
      required this.deletetodo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deletetodo,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                text,
                style: TextStyle(
                    decoration: value
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow[300],
              borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
