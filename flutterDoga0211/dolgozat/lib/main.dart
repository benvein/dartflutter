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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 204, 128, 13),
        ),
      ),
      home: const MyHomePage(title: 'Counter app'),
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
  int _counter = 100;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounterBy10() {
    setState(() {
      _counter = _counter + 10;
    });
  }

  void _decrementCounterBy10() {
    setState(() {
      _counter = _counter - 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current counter value',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrementCounter, child: Text('-1')),
                SizedBox(width: 30),
                ElevatedButton(onPressed: _incrementCounter, child: Text("+1")),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: _decrementCounterBy10,
                  height: 60,
                  child: Text('-10'),
                ),
                SizedBox(width: 80),
                MaterialButton(
                  onPressed: _incrementCounterBy10,
                  height: 60,
                  child: Text("+10"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
