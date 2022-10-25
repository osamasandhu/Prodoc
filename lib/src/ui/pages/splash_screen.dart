import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/auth/register_page.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        AppNavigation.pop(context);
        AppNavigation.to(context, const RegisterPage());

        timer.cancel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(AppImages.splashScreen,fit: BoxFit.cover,),
      ),
    );
  }
}
