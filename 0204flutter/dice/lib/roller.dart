import 'dart:math';

import 'package:flutter/material.dart';

Random randomize = Random();

class Roller extends StatefulWidget {
  const Roller({super.key});

  @override
  State<Roller> createState() {
    return _RollerState();
  }
}

class _RollerState extends State<Roller> {
  int currentDice = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        currentDice == 0
            ? Image.network(
                'https://i00.eu/img/605/330x330f/6hif4wib/381746.jpg',
                width: 300,
                height: 300,
              )
            : Image.asset(
                'assets/images/dice-$currentDice.png',
                width: 300,
                height: 300,
              ),
        TextButton.icon(
          onPressed: () {
            setState(() {
              currentDice = randomize.nextInt(6) + 1;
            });
          },
          icon: Icon(Icons.arrow_forward),
          label: Text('Roll dice'),
        ),
      ],
    );
  }
}
