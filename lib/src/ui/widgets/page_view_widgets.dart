import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/color.dart';


class ElevatedContainer extends StatelessWidget {
final  Widget child;
 final VoidCallback? onTap;
final  EdgeInsetsGeometry? padding;

  const ElevatedContainer({super.key, this.onTap, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColors.greyText.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5)
        ], borderRadius: BorderRadius.circular(22), color: Colors.white),
        child: child,
      ),
    );
  }
}

class SliderDotsWidget extends StatefulWidget {
 final int list;
 final int currentPage;

  const SliderDotsWidget({Key? key, required this.list, required this.currentPage})
      : super(key: key);

  @override
  State<SliderDotsWidget> createState() => _SliderDotsWidgetState();
}

class _SliderDotsWidgetState extends State<SliderDotsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < widget.list; i++)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: widget.currentPage == i
                    ? AppColors.blueColor
                    : AppColors.greyText,
              ),
            )
        ],
      ),
    );
  }
}
