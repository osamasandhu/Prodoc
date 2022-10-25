import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/utils/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  AppBarWidget({
    Key? key,
    required this.title,
    this.backgroundColor,
    // this.backgroundColor = AppColors.blueColor,
    this.action,
    this.showNotificationDot = true,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final Widget? action;
  final bool showNotificationDot;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.blueColor,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 17),
            child: action ?? const NotificationIconButton()),
      ],
    );
  }

  final _appBar = AppBar();

  @override
  Widget get child => _appBar;

  @override
  Size get preferredSize => _appBar.preferredSize;
}
