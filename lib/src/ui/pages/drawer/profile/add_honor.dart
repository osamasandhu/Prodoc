import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/drawer_page_body.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';

class AddHonorAndAwards extends StatefulWidget {
  const AddHonorAndAwards({Key? key}) : super(key: key);

  @override
  State<AddHonorAndAwards> createState() => _AddHonorAndAwardsState();
}

class _AddHonorAndAwardsState extends State<AddHonorAndAwards> {
  TextEditingController titleController = TextEditingController();
  TextEditingController issuedByController = TextEditingController();
  DateTime? startDate;

  @override
  Widget build(BuildContext context) {
    return DrawerPageBody(
      trailingChild: const DeleteIconButton(),
      pageTitle: 'Add honor & awards',
      children: [
        const LabelText(text: 'Title'),
        AppTextField(
          hint: 'Title',
          textEditingController: titleController,
        ),
        const LabelText(text: 'Issued By'),
        AppTextField(
          hint: 'Enter issued by',
          textEditingController: issuedByController,
        ),
        const LabelText(text: "Start Date"),
        DateTextField(
            selectedDate: startDate,
            onDateChanged: (value) => startDate = value),
 DrawerPagesBottomBUtton(
          text: 'Save & Proceed',
          onPressed: () {},
        )
      ],
    );
  }
}
