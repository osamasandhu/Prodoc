import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';

class CommunityView extends StatefulWidget {
  final String? url;
  final Color? color;

  const CommunityView({Key? key, this.url, this.color}) : super(key: key);

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coming Soon...',
              style: TextStyle(
                  color: widget.color ?? AppColors.blueColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            Image.asset(
              widget.url ?? AppImages.communityComingSoon,
            ),
          ],
        ),
      ),
    );
  }
}
