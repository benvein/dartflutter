import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() {
    return _DropdownButtonExampleState();
  }
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> subjects = [
    'Matematika',
    'Magyar nyelv és irodalom',
    'Történelem',
    'Angol nyelv',
    'Biológia',
  ];
  late String selectedSubject;
  List<String> levels = ["Középfok", "Emelt fok"];
  late String selectedLevel;

  @override
  void initState() {
    super.initState();
    selectedSubject = subjects[0];
    selectedLevel = levels[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedSubject,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSubject = newValue!;
                });
              },
              items: subjects.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Text('Selected subject: $selectedSubject'),
            SizedBox(height: 30),
            DropdownButton<String>(
              value: selectedLevel,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLevel = newValue!;
                });
              },
              items: levels.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Text('Selected level: $selectedLevel'),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
