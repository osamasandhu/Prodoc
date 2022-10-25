// ignore_for_file: use_build_context_synchronously

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:prodoc/src/ui/pages/home_page.dart';

import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/dialog_widget.dart';
import 'package:prodoc/src/ui/widgets/logo_container.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopLogoContainerWidget(
                url: AppImages.worldHealthDay, imageRequired: true),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Font14Weight500Blue(
                text: 'Welcome to Prodoc!',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            textWidget(
              text:
                  'Your account has been generated with the registered mobile number. ',
            ),
            const SizedBox(
              height: 16,
            ),
            textWidget(text: 'Continue your journey ahead.'),
            const Spacer(),
            _buildGoToDashButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoToDashButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: AuthButton(
        text: 'Go to Dashboard',
        onPressed: () async {
          bool locationOn = await location.serviceEnabled();

          locationOn
              ? AppNavigation.to(context, const HomePage())
              : locationPermission(
                  title:
                      'For a better experience, please turn on your device location.',
                  popButton: () {
                    AppNavigation.pop(context);
                    locationPermission(
                        title:
                            'Please note, you won’t be able to use some features of the app.',
                        popButton: () {
                          AppNavigation.pop(context);
                        },
                        popButtonText: 'OKAY');
                  },
                  popButtonText: 'CANCEL');
        },
      ),
    );
  }

  locationPermission(
      {required String title,
      required VoidCallback popButton,
      required String popButtonText}) {
    return CustomPermissionDialog(
      children: [
        Font14Weight400(
          text: title,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            _buildPopButton(
              text: popButtonText,
              onPressed: popButton,
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                await AppSettings.openLocationSettings(asAnotherTask: true);
                AppNavigation.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  foregroundColor: Colors.white),
              child: const Text('TURN ON LOCATION'),
            )
          ],
        )
      ],
    ).show(context);
  }

  Widget _buildPopButton(
      {required String text, required VoidCallback onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.blueColor),
          foregroundColor: AppColors.blueColor),
      child: Text(text),
    );
  }

  Widget textWidget({required String text}) {
    return Font14Weight400(textAlign: TextAlign.center,
      text: text,
      padding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
