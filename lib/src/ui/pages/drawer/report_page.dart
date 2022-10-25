import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
        trailingChild: const NotificationIconButton(),
        pageTitle: 'Reports',
        children: [
          Row(
            children: [
              const Expanded(
                child: Font14Weight500Blue(
                  text: 'Current reports',
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.download,
                  color: AppColors.blueColor,
                ),
              ),
            ],
          ),
          _buildReportsListTile(text: 'New (04)'),
          _buildReportsListTile(text: 'Treatment Ongoing (01)'),
          _buildReportsListTile(text: 'Closed (00)'),
          _buildReportsListTile(text: 'No show (00)'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              children: const [
                Expanded(
                  child: Font14Weight500Blue(
                    text: 'Old reports ',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Font14Weight500Blue(
                  text: 'Past 3 months',
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          _buildReportsListTile(text: 'August-2022', download: true),
          _buildReportsListTile(text: 'July-2022', download: true),
          _buildReportsListTile(text: 'June-2022', download: true),
        ]);
  }

  Widget _buildReportsListTile({required String text, bool download = false}) {
    return Column(
      children: [
        ListTile(
          dense: true,
          trailing: download ? const Icon(Icons.download) : null,
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          title: Font14Weight400(
            text: text,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Divider(
          height: 10,
        )
      ],
    );
  }
}
