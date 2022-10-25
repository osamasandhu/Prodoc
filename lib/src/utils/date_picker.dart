import 'package:flutter/material.dart';

Future<DateTime?> pickDate(
  BuildContext context, {
  DateTime? selectedDate,
}) async {
  final picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    initialDatePickerMode: DatePickerMode.day,
    firstDate: DateTime.now(),
    lastDate: DateTime(2400),
  );
  return picked;
}

Future<void> selectDate(BuildContext context, DateTime? selectedDate) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime(2400));
  if (picked != null) {
    selectedDate = picked;
  }
}
