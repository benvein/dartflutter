import 'package:flutter/material.dart';

class Allbutton extends StatefulWidget {
  const Allbutton({super.key});

  @override
  State<Allbutton> createState() {
    return _AllbuttonState();
  }
}

class _AllbuttonState extends State<Allbutton> {
  String materialText = "";
  String elevatedText = "";
  String textText = "";
  String outLinedText = "";
  String iconText = "";
  String floatinText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(materialText),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  materialText = "MaterialButton has been pressed";
                });
              },
              child: const Text("Show text"),
            ),
            SizedBox(width: 20),
            MaterialButton(
              onPressed: () {
                setState(() {
                  materialText = "";
                });
              },
              child: const Text("Remove text"),
            ),
          ],
        ),
        Text(elevatedText),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  elevatedText = "elevated button text";
                });
              },
              child: const Text("Show text"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  elevatedText = "";
                });
              },
              child: const Text("remove text"),
            ),
          ],
        ),
        Text(textText),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  textText = "text button text";
                });
              },
              child: const Text("Show text"),
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  textText = "";
                });
              },
              child: const Text("remove text"),
            ),
          ],
        ),
        Text(outLinedText),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  outLinedText = "outlined button text";
                });
              },
              child: const Text("Show text"),
            ),
            SizedBox(width: 20),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  outLinedText = "";
                });
              },
              child: const Text("remove text"),
            ),
          ],
        ),
        Text(iconText),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  iconText = "icon button text";
                });
              },
              icon: Icon(Icons.add),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  iconText = "";
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        Text(floatinText),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  floatinText = "floating button text";
                });
              },
              icon: Icon(Icons.add),
              label: const Text("show text"),
            ),
            SizedBox(width: 20),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  floatinText = "";
                });
              },
              icon: Icon(Icons.remove),
              label: const Text("remove text"),
            ),
          ],
        ),

      ],
    );
  }
}
