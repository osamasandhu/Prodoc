import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/add_education.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/add_experince.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/add_honor.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/delete_account.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/edit_general_porfile.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopContainer(),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGeneralProfileData(),
                  _buildDivider(),
                  _buildAreaOfPractice(),
                  _buildDivider(),
                  _buildAddOrEditButtonBlue(
                    text: 'Experience',
                    icon: Icons.add,
                    onTap: () {
                      AppNavigation.to(context, const AddExperince());
                    },
                  ),
                  for (int i = 0; i < 2; i++) _buildExperinceBody(),
                  _buildAddOrEditButtonBlue(
                    text: 'Education',
                    icon: Icons.add,
                    onTap: () {
                      AppNavigation.to(context, const AddEducation());
                    },
                  ),
                  for (int i = 0; i < 2; i++) _buildEducationBody(),
                  _buildAddOrEditButtonBlue(
                    text: 'Licenses, honors & awards',
                    icon: Icons.add,
                    onTap: () {
                      AppNavigation.to(context, const AddHonorAndAwards());
                    },
                  ),
                  for (int i = 0; i < 2; i++) _buildLicensesHonorsAwardsBody(),
                  TextButton(
                      onPressed: () {
                        AppNavigation.to(context, const DeleteAccountPage());
                      },
                      child: const Font14Weight500Blue(
                        text: 'Delete Account',
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _buildGeneralProfileData() {
    return Column(
      children: [
        _buildAddOrEditButtonBlue(
            text: 'General Profile',
            icon: Icons.edit_outlined,
            onTap: () {
              AppNavigation.to(context, const EditGeneralProfilePage());
            }),
        _buildRowTextTitleDetail(text1: 'Gender', text2: 'Female'),
        _buildRowTextTitleDetail(
            text1: 'Registration number', text2: 'PD00213769'),
        _buildRowTextTitleDetail(
            text1: 'Specialization', text2: 'General Practitioner'),
        _buildRowTextTitleDetail(
            text1: 'Email ID', text2: 'xyz@hospitalname.org'),
      ],
    );
  }

  Widget _buildAreaOfPractice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Font14Weight400(
          text: 'Areas of practice',
          padding: EdgeInsets.only(bottom: 5),
        ),
        Wrap(
          runSpacing: 8,
          spacing: 12,
          children: [
            for (int j = 0; j < 20; j++)
              Font14Weight400(
                text: 'cites',
                textColor: AppColors.greyText,
              )
          ],
        ),
      ],
    );
  }

  Widget _buildExperinceBody() {
    return Column(
      children: [
        _buildListTile(onTap: () {}),
        _buildRowTextTitleDetail(
            text1: 'Organization name', text2: 'AIMS Clinic'),
        Font14Weight400(
          text: loremIpsum,
          textColor: AppColors.greyText,
          padding: const EdgeInsets.only(top: 10),
        ),
        _buildDivider(),
      ],
    );
  }

  Widget _buildEducationBody() {
    return Column(
      children: [
        _buildListTile(
            onTap: () {},
            title: 'Degree name',
            subTitle: 'August, 2017- August, 2019'),
        _buildRowTextTitleDetail(text1: 'Institution name', text2: 'name'),
        _buildRowTextTitleDetail(text1: 'Study field', text2: 'name'),
        _buildDivider(),
      ],
    );
  }

  Widget _buildLicensesHonorsAwardsBody() {
    return Column(
      children: [
        _buildListTile(
            onTap: () {}, title: 'Title name', subTitle: 'December, 2020'),
        _buildRowTextTitleDetail(text1: 'Issued by', text2: 'XYZ Organization'),
        _buildDivider(),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 25);
  }

  Widget _buildAddOrEditButtonBlue(
      {required String text,
      required IconData icon,
      required VoidCallback onTap}) {
    return Row(
      children: [
        Expanded(
          child: Font14Weight500Blue(
            text: text,
            fontSize: 16,
          ),
        ),
        _buildIconButton(icon: icon, onTap: onTap, color: AppColors.blueColor)
      ],
    );
  }

  _buildListTile(
      {String? title, String? subTitle, required VoidCallback onTap}) {
    return ListTile(
      subtitle: Font14Weight400(
        text: subTitle ?? 'January, 2021- Present',
        fontSize: 10,
      ),
      trailing: _buildIconButton(
          icon: Icons.edit_outlined, color: AppColors.greyText, onTap: () {}),
      title: Font14Weight400(
        fontWeight: FontWeight.w600,
        text: title ?? 'Gynaecologist & obstetrician',
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }

  Widget _buildRowTextTitleDetail({
    required String text1,
    required String text2,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Font14Weight400(
            text: text1,
          ),
          const Spacer(),
          Font14Weight400(
            text: text2,
            textColor: AppColors.greyText,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onTap, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: color ?? Colors.white,
      ),
    );
  }

  Widget _buildTopButtonRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          _buildIconButton(
            onTap: () {
              AppNavigation.pop(context);
            },
            icon: Icons.chevron_left,
          ),
          const Spacer(),
          _buildIconButton(
            onTap: () {},
            icon: Icons.share_outlined,
          ),
          const SizedBox(
            width: 10,
          ),
          _buildIconButton(
            onTap: () {},
            icon: Icons.settings_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildTopContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _buildTopButtonRow(),
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

class ProfilePagesIconButtons extends StatefulWidget {
  final IconData icon;
  final  VoidCallback onTap;
 final Color? color;

  const ProfilePagesIconButtons({Key? key,required this.onTap,this.color,required this.icon}) : super(key: key);

  @override
  State<ProfilePagesIconButtons> createState() =>
      _ProfilePagesIconButtonsState();
}

class _ProfilePagesIconButtonsState extends State<ProfilePagesIconButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Icon(
        widget.icon,
        color: widget.color ?? Colors.white,
      ),
    );
  }
}
