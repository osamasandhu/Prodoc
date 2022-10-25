import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/color.dart';

class HaveOrNotAccount extends StatefulWidget {
  final String haveText;
  final String authText;
  final VoidCallback onTap;

  const HaveOrNotAccount(
      {Key? key,
      required this.onTap,
      required this.authText,
      required this.haveText})
      : super(key: key);

  @override
  State<HaveOrNotAccount> createState() => _HaveOrNotAccountState();
}

class _HaveOrNotAccountState extends State<HaveOrNotAccount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: widget.haveText,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: widget.authText,
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => widget.onTap,
              )
            ],
          ),
        ),
      ),
    );
  }
}
