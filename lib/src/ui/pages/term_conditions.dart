import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/const.dart';

import '../../utils/nav.dart';
import '../widgets/logo_container.dart';

class TermAndConditions extends StatefulWidget {
  const TermAndConditions({Key? key}) : super(key: key);

  @override
  State<TermAndConditions> createState() => _TermAndConditionsState();
}

class _TermAndConditionsState extends State<TermAndConditions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopLogoContainerWidget(),
            Expanded(
              child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),  padding: const EdgeInsets.only(
                  right: 24,
                  left: 24,
                  top: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Font14Weight500Blue(
                      text: 'Terms and conditions',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    text(),
                    for (int i = 0; i < 10; i++) loremText(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: BottomNavTextButtonWidget(
                        onPressed: () {
                          AppNavigation.pop(context);
                        },
                        text: 'back',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget text() {
    return const Font14Weight400(
        text:
            'Terms of service (also known as terms of use and terms and conditions, commonly abbreviated as TOS or ToS, ToU or T&C) are the legal agreements between a service provider and a person who wants to use that service. The person must agree to abide by the terms of service in order to use the offered service.');
  }

  Widget loremText() {
    return Font14Weight400(
      text: loremIpsum + loremIpsum,
      fontSize: 12,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    );
  }
}
