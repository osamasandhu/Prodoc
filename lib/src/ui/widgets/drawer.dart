import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/profile_page.dart';
import 'package:prodoc/src/ui/pages/drawer/report_page.dart';
import 'package:prodoc/src/ui/pages/drawer/setting.dart';
import 'package:prodoc/src/ui/pages/drawer/subscription_page.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
          child: Column(
            children: [
              _buildProfileContainer(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      _buildDrawerListTile(
                          url: AppImages.userLogo,
                          title: 'Profile',
                          onTap: () {
                            AppNavigation.to(context, const ProfilePage());
                          }),
                      _buildDrawerListTile(
                        url: AppImages.settingLogo,
                        title: 'Settings',
                        onTap: () {
                          AppNavigation.to(context, const SettingPage());
                        },
                      ),
                      _buildDrawerListTile(
                          onTap: () {
                            AppNavigation.to(context, const SubscriptionPage());
                          },
                          url: AppImages.subscriptionLogo,
                          title: 'Subscription details'),
                      _buildDrawerListTile(
                          onTap: () {
                            AppNavigation.to(context, const ReportPage());
                          },
                          url: AppImages.reportLogo,
                          title: 'Reports'),
                      const Divider(),
                      _buildDrawerListTile(
                          url: AppImages.informationLogo, title: 'About PRODOC'),
                      _buildDrawerListTile(url: AppImages.forumLogo, title: 'FAQs'),
                      _buildDrawerListTile(
                          url: AppImages.callLogo, title: 'Contact us'),
                      _buildDrawerListTile(
                          url: AppImages.referLogo, title: 'Refer a friend'),
                      const Divider(),
                      _buildDrawerListTile(
                          url: AppImages.logoutLogo, title: 'Log out'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildDrawerListTile(
      {required String url, required String title, VoidCallback? onTap}) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Image.asset(
        url,
        height: 24,
        width: 24,
      ),
      title: Font14Weight400(
        text: title,
        fontSize: 16,
      ),
    );
  }

  Widget _buildProfileContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: AppColors.blueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
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
            text: 'Dr. Seema Deshmukh',
            fontSize: 16,
            textAlign: TextAlign.center,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 4,
          ),
          const Font14Weight500Blue(
            text: 'MBBS | Pune, Maharashtra, India',
            fontSize: 12,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
