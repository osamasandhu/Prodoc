import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
      trailingChild: const NotificationIconButton(),
      pageTitle: 'Subscription details',
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColors.greyText.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xffF5F5F5)),
          margin: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              const Font14Weight400(
                text: 'Prodoc Premium',
                fontWeight: FontWeight.w600,
              ),
              const Font14Weight400(
                padding: EdgeInsets.symmetric(vertical: 21),
                textAlign: TextAlign.center,
                text:
                    'Unlock all of our features to be in complete control of your experience',
              ),
              DrawerPagesBottomBUtton(
                  color: AppColors.greyText,
                  text: 'Upgrade to Premium',
                  onPressed: () {})
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child:
                  textW600(text: 'What you get:', textAlign: TextAlign.start),
            ),
            const SizedBox(
              width: 5,
            ),
            textW600(
              text: 'Free',
            ),
            const SizedBox(
              width: 5,
            ),
            textW600(text: 'Premium'),
          ],
        ),
        const Divider(height: 25),
        for (int i = 0; i < 10; i++)
          Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Font14Weight400(
                      text: 'Patient centric communication',
                      fontSize: 12,
                    ),
                  ),
                  checkMark(),
                  checkMark(),
                ],
              ),
              const Divider(height: 25),
            ],
          )
      ],
    );
  }

  Widget textW600({required String text, TextAlign? textAlign}) {
    return SizedBox(
      width: 65,
      child: Font14Weight400(
        text: text,
        fontWeight: FontWeight.w600,
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }

  Widget checkMark({String? width}) {
    return SizedBox(
      width: 65,
      child: Center(
        child: Icon(
          Icons.check_circle,
          color: AppColors.blueColor,
        ),
      ),
    );
  }
}
