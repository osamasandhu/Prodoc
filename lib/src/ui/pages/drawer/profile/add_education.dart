import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/check_box_widget.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({Key? key}) : super(key: key);

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  TextEditingController instituteController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController studyFieldController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
        trailingChild: const DeleteIconButton(),
        pageTitle: 'Add Education',
        children: [
          const LabelText(text: 'Institute Name'),
          AppTextField(
            hint: 'Enter institute name',
            textEditingController: instituteController,
          ),
          const LabelText(text: 'Degree'),
          AppTextField(
            hint: 'Enter degree',
            textEditingController: degreeController,
          ),
          const LabelText(text: 'Field of Study'),
          AppTextField(
            hint: 'Enter field of study',
            textEditingController: studyFieldController,
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
