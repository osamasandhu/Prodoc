import 'package:flutter/material.dart';

class CustomPermissionDialog extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const CustomPermissionDialog(
      {super.key, required this.children, this.padding});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  show(BuildContext context) {
    return showDialog(context: context, builder: (_) => this);
  }
}
