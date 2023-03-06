import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/home/community_view.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  @override
  Widget build(BuildContext context) {
    return CommunityView(
      color: AppColors.greenColor,
      url: AppImages.servicesComingSoon,
    );
  }
}
