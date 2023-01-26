import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timetutor/dialogs/color_picker.dart';
import 'package:timetutor/dialogs/subject_picker.dart';
import 'package:timetutor/models/models.dart';

Future<bool> taskEditorDialog(
    BuildContext context, Task task, Iterable<Subject> subjects) async {
  bool doneClicked = false;
  await showDialog(
      context: context,
      builder: ((context) {
        return StatefulBuilder(builder: (context, setState) {
          Color color =
              Color(task.color ?? Theme.of(context).primaryColorLight.value);
          DateTime now = DateTime.now();
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: task.title,
                    validator: (value) {
                      if (value!.isEmpty) return "Title cannot be empty";
                      if (value.length > 1000) return "Ain't no way";
                      task.title = value;
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      labelText: "Title",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Color? color = await colorPickerDialog(context);
                          setState(() {
                            if (color != null) {
                              task.color = color.value;
                            }
                          });
                        },
                        icon: const Icon(Icons.color_lens),
                      ),
                      Text('#${color.value.toRadixString(16)}'),
                      CircleAvatar(
                        backgroundColor: color,
                        radius: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                              context: context,
                              initialDate: task.date,
                              firstDate: now,
                              lastDate: now.add(const Duration(days: 365)));
                          if (date != null) {
                            setState(() {
                              task.date = date;
                            });
                          }
                        },
                        icon: const Icon(Icons.date_range),
                      ),
                      Column(
                        children: [
                          Text(
                            Jiffy(task.date).yMMMMEEEEd,
                            style: TextStyle(
                                decoration: task.subject != null
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          Text(
                            Jiffy(task.date.add(const Duration(days: 1)))
                                .fromNow(),
                            style: TextStyle(
                                decoration: task.subject != null
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await showSubjectPickerDialog(
                              context,
                              subjects,
                              onSelect: (subject) {
                                setState(() {
                                  task.subject = subject;
                                });
                              },
                            );
                          },
                          icon: const Icon(Icons.book)),
                      if (task.subject != null)
                        Row(
                          children: [
                            Text(task.subject!.name),
                            IconButton(
                                onPressed: () async {
                                  setState(() {
                                    task.subject = null;
                                  });
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: Theme.of(context).iconTheme.color,
                                ))
                          ],
                        ),
                    ],
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (() {
                    doneClicked = true;
                    Navigator.of(context).pop();
                  }),
                  child: const Text("Done")),
            ],
          );
        });
      }));
  return doneClicked;
}
