import 'package:flutter/material.dart';
import 'package:timetutor/models/models.dart';

Future showSubjectPickerDialog(BuildContext context, Iterable<Subject> subjects,
    {required void Function(Subject subject) onSelect}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text("Select subject",
                    style: Theme.of(context).textTheme.headlineSmall!),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .3,
                  child: GridView.count(
                    padding: const EdgeInsets.all(4.0),
                    crossAxisCount: 3,
                    children: [
                      for (var subject in subjects)
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onSelect(subject);
                              },
                              child: Text(subject.name)),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
