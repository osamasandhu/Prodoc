// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/text.dart';

class CheckBoxWidget extends StatefulWidget {
  bool isChecked;
 final String? title;

  CheckBoxWidget({Key? key, required this.isChecked, this.title})
      : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: widget.isChecked,
      onChanged: (v) {
        widget.isChecked = v!;
        setState(() {});
      },
      controlAffinity: ListTileControlAffinity.leading,
      title:
          Font14Weight400(text: widget.title ?? 'I am currently studying here'),
    );
  }
}
