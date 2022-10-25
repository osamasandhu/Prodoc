import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/add_education.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/check_box_widget.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';
import 'package:prodoc/src/utils/color.dart';

import '../../../widgets/drop_down.dart';

class AddExperince extends StatefulWidget {
  const AddExperince({Key? key}) : super(key: key);

  @override
  State<AddExperince> createState() => _AddExperinceState();
}

class _AddExperinceState extends State<AddExperince> {
  TextEditingController titleController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  bool isChecked = false;
  String? organizationType;
  List<String> organizationTypeList = <String>[
    "Government institution",
    "Super-speciality hospital",
    "Multi-speciality hospital",
    "Single-speciality hospital",
    "Private clinic",
    "Labs/radiology center",
    "Medical educational institution",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
      trailingChild: const DeleteIconButton(),
      pageTitle: 'Add Experince',
      children: [
        const LabelText(text: 'Title *'),
        AppTextField(
          hint: 'Enter title',
          textEditingController: titleController,
        ),
        const LabelText(text: 'Organization type *'),
        DropDownWidget(
          list: organizationTypeList,
          select: organizationType,
          hint: 'Select organization type',
        ),
        const LabelText(text: 'Organization name *'),
        AppTextField(
          hint: 'Enter organization name ',
          textEditingController: organizationNameController,
        ),
        const LabelText(text: 'Location'),
        AppTextField(
          hint: 'Enter location',
          textEditingController: locationController,
        ),
        CheckBoxWidget(isChecked: isChecked),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              dateField(label: 'Start Date', date: startDate),
              const SizedBox(
                width: 24,
              ),
              dateField(label: 'End Date', date: endDate),
            ],
          ),
        ),
        Font14Weight400(text: 'Description', textColor: AppColors.greyText),
        _buildDescriptionField(),
        DrawerPagesBottomBUtton(
          text: 'Save & Proceed',
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: TextFormField(
        maxLength: 200,
        maxLines: 6,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: 'Write a brief description here.',
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.blueColor),
          ),
        ),
      ),
    );
  }
}
