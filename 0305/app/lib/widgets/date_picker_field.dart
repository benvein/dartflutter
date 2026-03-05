import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final VoidCallback onTap;
  final int Function(DateTime) calculateAge;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onTap,
    required this.calculateAge,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: 'Születési dátum',
        hintText: 'yyyy.MM.dd',
        prefixIcon: const Icon(Icons.calendar_today),
        suffixIcon: IconButton(
          icon: const Icon(Icons.edit_calendar),
          onPressed: onTap,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Kötelező megadni a születési dátumot!';
        }
        if (selectedDate == null) {
          return 'Válassz dátumot!';
        }
        if (selectedDate!.isAfter(DateTime.now())) {
          return 'A dátum nem lehet jövőbeli!';
        }
        if (calculateAge(selectedDate!) < 18) {
          return 'Legalább 18 évesnek kell lenned!';
        }
        return null;
      },
    );
  }
}
