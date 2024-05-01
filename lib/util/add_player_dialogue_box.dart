import "package:App/util/button.dart";
import "package:flutter/material.dart";

class AddPlayerBox extends StatelessWidget {
  AddPlayerBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a New Player'
              ),
            ),

            //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save Button
              Button(text: "Save", onPressed: onSave),
              const SizedBox(width: 6),
              //cancel Button
              Button(text: "Cancel", onPressed: onCancel)

            ],
          )
          ],
        ),
      ),
    );
  }
}