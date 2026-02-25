import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        themeMode: _themeMode,
        onThemeModeChanged: _setThemeMode,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final String title;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: PopupMenuButton<ThemeMode>(
          icon: const Icon(Icons.brightness_6, size: 48),
          iconSize: 48,
          onSelected: widget.onThemeModeChanged,
          itemBuilder: (BuildContext context) => [
            CheckedPopupMenuItem<ThemeMode>(
              value: ThemeMode.light,
              checked: widget.themeMode == ThemeMode.light,
              child: const Text('Light'),
            ),
            CheckedPopupMenuItem<ThemeMode>(
              value: ThemeMode.dark,
              checked: widget.themeMode == ThemeMode.dark,
              child: const Text('Dark'),
            ),
            CheckedPopupMenuItem<ThemeMode>(
              value: ThemeMode.system,
              checked: widget.themeMode == ThemeMode.system,
              child: const Text('System Default'),
            ),
          ],
        ),
      ),
    );
  }
}
