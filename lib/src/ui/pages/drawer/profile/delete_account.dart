import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/dialog_widget.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
        trailingChild: const SizedBox(),
        pageTitle: 'Delete Account',
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blueColor),
                  borderRadius: BorderRadius.circular(120),
                  color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.asset(
                  AppImages.profilePerson,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Font14Weight500Blue(
            text: 'Deactivate account insted of deleting?',
            fontSize: 16,
          ),
          const Font14Weight400(
            text: 'Deactivating an account is temporary',
            padding: EdgeInsets.only(top: 40, bottom: 16),
          ),
          Font14Weight400(
            text:
                'Your account information will be hidden until you will log back in. After 24 hours you would be able to log in to your account again.',
            fontSize: 12,
            textColor: AppColors.greyText,
          ),
          const Font14Weight400(
            text: 'Deleting an account is permanent',
            padding: EdgeInsets.only(top: 40, bottom: 16),
          ),
          Font14Weight400(
            text:
                'Your account will be permanently deleted and you will lose all data present in it.',
            fontSize: 12,
            textColor: AppColors.greyText,
            padding: const EdgeInsets.only(bottom: 20),
          ),
          Row(
            children: [
              Expanded(
                child: OutLineButtonWidget(
                  text: 'Delete',
                  onPressed: () {
                    CustomPermissionDialog(
                      children: [
                        const Font14Weight400(
                          text: 'Are you sure you want to delete your account?',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  AppNavigation.pop(context);
                                },
                                style: TextButton.styleFrom(
                                    side:
                                        BorderSide(color: AppColors.blueColor),
                                    foregroundColor: Colors.white),
                                child: Font14Weight400(
                                  text: 'No',
                                  textColor: AppColors.blueColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                                child: TextButton(
                              onPressed: () async {
                                AppNavigation.pop(context);

                                CustomPermissionDialog(
                                  children: const [
                                    Font14Weight400(
                                        text:
                                            'Your request has been submitted. You will be logged out of the account in sometime and will not be able to sign in again.'),
                                  ],
                                ).show(context);
                                delayFunction();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.blueColor,
                                  foregroundColor: Colors.white),
                              child: const Text('Yes'),
                            ))
                          ],
                        )
                      ],
                    ).show(context);
                  },
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                  child: DrawerPagesBottomBUtton(
                text: 'Deactivate',
                onPressed: () {
                  CustomPermissionDialog(
                    children: const [
                      Font14Weight400(
                          text:
                              'Your account will be deactivated temporarily in a few minutes. To  get back on Prodoc log in to your account anytime after 24 hours.'),
                    ],
                  ).show(context);
                  delayFunction();
                },
              ))
            ],
          )
        ]);
  }

  void delayFunction() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        AppNavigation.pop(context);
        AppNavigation.pop(context);
      },
    );
  }
}
