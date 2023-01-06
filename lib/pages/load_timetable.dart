import 'package:flutter/material.dart';

class LoadTimeTablePage extends StatefulWidget {
  const LoadTimeTablePage({super.key});

  @override
  State<LoadTimeTablePage> createState() => _LoadTimeTablePageState();
}

class _LoadTimeTablePageState extends State<LoadTimeTablePage> {
  @override
  Widget build(BuildContext context) {
    var uri = '';
    return Scaffold(
      body: Column(
        children: [
          const Text("Enter URL"),
          TextField(
            onChanged: (value) {
              uri = value;
            },
          ),
          TextButton(onPressed: () {}, child: const Text("Fetch")),
        ],
      ),
    );
  }
}
