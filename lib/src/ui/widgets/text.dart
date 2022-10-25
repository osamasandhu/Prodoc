import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/color.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Font14Weight400(
      text: text,
      textColor: AppColors.greyText,
    );
  }
}

class Font14Weight400 extends StatelessWidget {
  final String text;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final TextAlign? textAlign;
final FontWeight? fontWeight;
  const Font14Weight400(
      {Key? key,
      required this.text,
      this.textAlign,
      this.textColor,
      this.padding,
    this.fontWeight,  this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight:fontWeight?? FontWeight.w400,
            color: textColor ?? Colors.black),
      ),
    );
  }
}

class Font14Weight500Blue extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const Font14Weight500Blue(
      {Key? key,
      this.textAlign,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? AppColors.blueColor,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
