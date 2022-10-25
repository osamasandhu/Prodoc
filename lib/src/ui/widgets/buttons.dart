import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? borderRadius;

  const AuthButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.borderRadius})
      : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.blueColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
        ),
      ),
      child: Font14Weight500Blue(
        text: widget.text,
        textColor: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}

class DrawerPagesBottomBUtton extends StatefulWidget {
  final String text;
  final Color? color;
  final VoidCallback onPressed;

  const DrawerPagesBottomBUtton({
    Key? key,
    required this.text,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<DrawerPagesBottomBUtton> createState() =>
      _DrawerPagesBottomBUttonState();
}

class _DrawerPagesBottomBUttonState extends State<DrawerPagesBottomBUtton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: widget.color ?? AppColors.blueColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(120),
        ),
      ),
      child: Font14Weight500Blue(
        text: widget.text,
        textColor: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class OutlineIconButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  const OutlineIconButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  State<OutlineIconButtonWidget> createState() =>
      _OutlineIconButtonWidgetState();
}

class _OutlineIconButtonWidgetState extends State<OutlineIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blueColor)),
      child: InkWell(
        onTap: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: AppColors.blueColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Font14Weight500Blue(
              text: widget.text,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavTextButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const BottomNavTextButtonWidget(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  State<BottomNavTextButtonWidget> createState() =>
      _BottomNavTextButtonWidgetState();
}

class _BottomNavTextButtonWidgetState extends State<BottomNavTextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      alignment: Alignment.bottomRight,
      height: 50,
      child: TextButton(
        onPressed: widget.onPressed,
        child: Font14Weight500Blue(
          text: widget.text,
          fontSize: 12,
        ),
      ),
    );
  }
}

class OutLineButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const OutLineButtonWidget(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  State<OutLineButtonWidget> createState() => _OutLineButtonWidgetState();
}

class _OutLineButtonWidgetState extends State<OutLineButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(120),
          ),
          side: BorderSide(color: AppColors.blueColor),
          foregroundColor: AppColors.blueColor),
      child: Text(widget.text),
    );
  }
}

class DeleteIconButton extends StatefulWidget {
  const DeleteIconButton({Key? key}) : super(key: key);

  @override
  State<DeleteIconButton> createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}

class NotificationIconButton extends StatefulWidget {
  const NotificationIconButton({Key? key}) : super(key: key);

  @override
  State<NotificationIconButton> createState() => _NotificationIconButtonState();
}

class _NotificationIconButtonState extends State<NotificationIconButton> {
  @override
  Widget build(BuildContext context) {
    return               Stack(
      children: [
        const Center(child: Icon(Icons.notifications_none)),
        Positioned(
          right: 2,
          top: -10,
          bottom: 0,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFE40101),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );

  }
}
