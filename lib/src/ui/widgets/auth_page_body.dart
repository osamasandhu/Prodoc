import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/have_or_not_account_rich_text.dart';
import 'package:prodoc/src/ui/widgets/logo_container.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';

class AuthPageBody extends StatefulWidget {
  final String pageName;
  final String titleField;
  final String otpDescription;
  final String authButtonText;
  final String richButtonText;
  final String richAuthButtonText;
  final VoidCallback? richButtonOnTap;
  final VoidCallback authButtonOnTap;
  final Widget child;
  final String url;

  const AuthPageBody(
      {Key? key,
      required this.url,
      required this.child,
      required this.richAuthButtonText,
      required this.pageName,
      required this.authButtonText,
      required this.otpDescription,
      this.richButtonOnTap,
      required this.authButtonOnTap,
      required this.titleField,
      required this.richButtonText})
      : super(key: key);

  @override
  State<AuthPageBody> createState() => _AuthPageBodyState();
}

class _AuthPageBodyState extends State<AuthPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopLogoContainerWidget(
            imageRequired: true,
            url: widget.url,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Font14Weight500Blue(
                    text: widget.pageName,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: LabelText(
                      text: widget.titleField,
                    ),
                  ),
                  widget.child,
                  Font14Weight400(
                    text: widget.otpDescription,
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    fontSize: 12,
                    textColor: AppColors.greyText,
                  ),
                  AuthButton(
                      text: widget.authButtonText,
                      onPressed: widget.authButtonOnTap),
                  HaveOrNotAccount(
                      onTap: widget.richButtonOnTap ?? () {},
                      authText: widget.richAuthButtonText,
                      haveText: widget.richButtonText),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
