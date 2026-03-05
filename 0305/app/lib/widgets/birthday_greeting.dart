import 'package:flutter/material.dart';

class BirthdayGreeting extends StatelessWidget {
  final int age;

  const BirthdayGreeting({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink.shade100, Colors.amber.shade100],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.shade400, width: 2),
      ),
      child: Column(
        children: [
          const Text('🎂', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 12),
          Text(
            'Boldog születésnapot! 🎉',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ma töltöd be a(z) $age. életéved!',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.pink.shade600),
          ),
        ],
      ),
    );
  }
}
