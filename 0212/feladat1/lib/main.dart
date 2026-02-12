import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> classes = [
    "9.ny",
    "9.a",
    "9.b",
    "9.c",
    "10.a",
    "10.b",
    "10.c",
    "11.a",
    "11.b",
    "11.c",
    "12.a",
    "12.b",
    "12.c",
    "13.a",
    "13.b",
    "13.c",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 16,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(classes[index]),
          );
        },
      ),
    );
  }
}
