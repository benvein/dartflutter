import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgeResultCard extends StatelessWidget {
  final DateTime selectedDate;
  final int age;
  final bool isBirthday;

  const AgeResultCard({
    super.key,
    required this.selectedDate,
    required this.age,
    required this.isBirthday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isBirthday ? Colors.amber.shade50 : Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isBirthday
              ? Colors.amber.shade300
              : Colors.deepPurple.shade200,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Születési dátum:',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 4),
          Text(
            DateFormat('yyyy.MM.dd').format(selectedDate),
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Életkor:',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 4),
          Text(
            '$age éves',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6A11CB),
            ),
          ),
        ],
      ),
    );
  }
}
