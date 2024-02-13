import 'package:flutter/material.dart';
import 'package:to_do_app/components/button_style.dart';

class Dilouge extends StatelessWidget {
  TextEditingController? Controller = TextEditingController();
  VoidCallback onSave;
  VoidCallback onCancle;
  Dilouge(
      {super.key,
      required this.Controller,
      required this.onSave,
      required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Colors.yellow[300],
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: Controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add todo"),
            ),
            Row(
              children: [
                Button(onPressed: onSave, text: "Save"),
                SizedBox(
                  width: 5,
                ),
                Button(onPressed: onCancle, text: "Cancle")
              ],
            )
          ],
        ),
      ),
    );
  }
}
