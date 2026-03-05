import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/age_result_card.dart';
import 'widgets/birthday_greeting.dart';
import 'widgets/date_picker_field.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;

  /// Betöltött életkor kiszámítása
  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Ma van-e a születésnapja?
  bool _isBirthdayToday(DateTime birthDate) {
    final today = DateTime.now();
    return today.month == birthDate.month && today.day == birthDate.day;
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'Válaszd ki a születési dátumod',
      cancelText: 'Mégse',
      confirmText: 'OK',
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy.MM.dd').format(picked);
      });
      _formKey.currentState?.validate();
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final age = _selectedDate != null ? _calculateAge(_selectedDate!) : null;
    final isBirthday = _selectedDate != null
        ? _isBirthdayToday(_selectedDate!)
        : false;
    final isValid = _formKey.currentState?.validate() ?? false;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Cím
                        const Icon(
                          Icons.cake_outlined,
                          size: 48,
                          color: Color(0xFF6A11CB),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Születési dátum',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6A11CB),
                              ),
                        ),
                        const SizedBox(height: 24),

                        // Dátumválasztó mező
                        DatePickerField(
                          controller: _dateController,
                          selectedDate: _selectedDate,
                          onTap: _pickDate,
                          calculateAge: _calculateAge,
                        ),
                        const SizedBox(height: 24),

                        // Eredmény megjelenítése
                        if (_selectedDate != null &&
                            age != null &&
                            isValid) ...[
                          AgeResultCard(
                            selectedDate: _selectedDate!,
                            age: age,
                            isBirthday: isBirthday,
                          ),

                          // Születésnapi üdvözlés
                          if (isBirthday) ...[
                            const SizedBox(height: 24),
                            BirthdayGreeting(age: age),
                          ],
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
