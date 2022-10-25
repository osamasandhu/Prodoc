// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> list;
  final String? select;
  final String hint;

  const DropDownWidget({
    Key? key,
    required this.list,
    required this.hint,
    required this.select,
  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? select;

  @override
  void initState() {
    super.initState();
    select = widget.select;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        hint: Text(
          widget.hint,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black,
        ),
        value: select,
        items: widget.list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScope.of(context).requestFocus(FocusNode());

          setState(
            () {
              select = _!;
            },
          );
        },
      ),
    );
  }
}
