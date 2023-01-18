import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> colorPickerDialog(
    BuildContext context, Color defaultColor) async {
  Color? color;
  await showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          content: SingleChildScrollView(
              child: BlockPicker(
            pickerColor: defaultColor,
            onColorChanged: (color_) {
              color = color_;
            },
          )),
          actions: [
            TextButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                child: const Text("Done")),
          ],
        );
      }));
  return color;
}
