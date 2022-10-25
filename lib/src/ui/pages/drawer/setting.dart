import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
      trailingChild: const NotificationIconButton(),
      pageTitle: 'Settings',
      children: [
        _buildSettingListTile(title: 'Push notifications',),
        _buildSettingListTile(title: 'Help center'),
        _buildSettingListTile(title: 'Privacy policy'),
      ],
    );
  }

  Widget _buildSettingListTile(
      {required String title, IconData? icon, VoidCallback? onTap}) {
    return ListTile(onTap: onTap,
      title: Font14Weight400(
        text: title,
        fontSize: 16,
      ),
      trailing: Icon(icon ?? Icons.arrow_forward),
    );
  }
}
