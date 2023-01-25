// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodoc/src/utils/date_picker.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.hint,
    this.label,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.floatLabel = false,
    this.textEditingController,

    /// TODO: Remove this.
    BuildContext? context,
    // required this.obscure,
    this.onTap,
  }) : super(key: key);

  // final bool obscure;
  final String? hint;
  final String? label;

  final IconData? prefixIcon;
  final bool floatLabel;

  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        onTap: onTap,
        keyboardType: keyboardType,
        validator: validator,
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            hintStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
            hintText: hint),
        cursorColor: Colors.grey,
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.hint,
    this.label,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.onChanged,
    this.floatLabel = false,
    this.textEditingController,

    /// TODO: Remove this.
    BuildContext? context,
    // required this.obscure,
    this.onTap,
  }) : super(key: key);

  // final bool obscure;
  final String? hint;
  final String? label;

  final IconData? prefixIcon;
  final bool floatLabel;

  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onTap: onTap,
      keyboardType: keyboardType,
      validator: validator,
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: Colors.grey)),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(
              color: Color(0xff858889), fontWeight: FontWeight.w400,fontSize: 12),
          hintText: hint),
      cursorColor: Colors.grey,
    )
    ;
  }
}

class DateTextField extends StatefulWidget {
  DateTime? selectedDate;
  final void Function(DateTime) onDateChanged;

  DateTextField({
    Key? key,
    this.selectedDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
          onTap: () async {
            widget.selectedDate =
                await pickDate(context, selectedDate: widget.selectedDate);
            setState(() {});
            if (widget.selectedDate != null) {
              widget.onDateChanged(widget.selectedDate!);
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: widget.selectedDate == null
                      ? 'dd/mm/yyyy'
                      : DateFormat('dd/M/yyyy').format(
                          widget.selectedDate!,
                        ),
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(Icons.calendar_today)),
              onChanged: (v) {
                setState(() {
                  widget.selectedDate = v as DateTime?;
                });
              },
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          )),
    );
  }
}
