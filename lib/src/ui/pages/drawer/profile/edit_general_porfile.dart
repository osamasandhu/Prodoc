import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/area_of_practice.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/drop_down.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';

class EditGeneralProfilePage extends StatefulWidget {
  const EditGeneralProfilePage({Key? key}) : super(key: key);

  @override
  State<EditGeneralProfilePage> createState() => _EditGeneralProfilePageState();
}

class _EditGeneralProfilePageState extends State<EditGeneralProfilePage> {
  TextEditingController emailController =
      TextEditingController(text: 'xyz@hospitalname.org');
  TextEditingController nameController =
      TextEditingController(text: 'Seema Deshmukh');
  TextEditingController registrationController =
      TextEditingController(text: 'XXXXXXXXXXXX');
  TextEditingController specilizationController =
      TextEditingController(text: 'General Practitioner');
  String? title = 'Doctor (Dr.)';

  String? gender = 'Female';

  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
        trailingChild: const SizedBox(),
        pageTitle: 'Edit General Profile',
        children: [
          const LabelText(text: 'Your title *'),
          DropDownWidget(
            list: titleDropDownList,
            select: title,
            hint: 'Select your title',
          ),
          const LabelText(text: 'Name'),
          AppTextField(
            textEditingController: nameController,
            hint: 'Enter your name',
          ),
          const LabelText(text: 'Gender'),
          DropDownWidget(
            list: genderDropDownList,
            select: gender,
            hint: 'Select your gender',
          ),
          const LabelText(text: 'Registration number'),
          AppTextField(
            hint: 'Enter registration number',
            textEditingController: registrationController,
          ),
          const LabelText(text: 'Specialization'),
          AppTextField(
            hint: 'Enter specialization',
            textEditingController: specilizationController,
          ),
          const LabelText(text: 'Email ID'),
          AppTextField(
            hint: 'Enter email id',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailController,
          ),
          Font14Weight400(
            text: 'Areas of practice',
            textColor: AppColors.greyText,
            padding: const EdgeInsets.only(bottom: 16),
          ),
          const AreaOfPracticeView(padding: 0),
          DrawerPagesBottomBUtton(
            text: 'Save & Proceed',
            onPressed: () {},
          )
        ]);
  }
}

Widget dateField({required String label, DateTime? date}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(text: label),
        DateTextField(
            selectedDate: date, onDateChanged: (value) => date = value),
      ],
    ),
  );
}
