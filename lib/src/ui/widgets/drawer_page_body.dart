import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/app_bar_widget.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';

class DrawerPageBody extends StatefulWidget {
  final List<Widget> children;
  final String pageTitle;
  final Widget? trailingChild;

  const DrawerPageBody({
    Key? key,
    this.trailingChild,
    required this.children,
    required this.pageTitle,
  }) : super(key: key);

  @override
  State<DrawerPageBody> createState() => _DrawerPageBodyState();
}

class _DrawerPageBodyState extends State<DrawerPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: widget.pageTitle,
          action: widget.trailingChild ?? const NotificationIconButton()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.children,
        ),
      ),
    );
  }
}
