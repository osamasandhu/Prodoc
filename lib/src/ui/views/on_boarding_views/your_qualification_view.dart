import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_detail.dart';
import 'package:prodoc/src/ui/widgets/drop_down.dart';
import 'package:prodoc/src/ui/widgets/text.dart';

class YourQualificationsView extends StatefulWidget {
  const YourQualificationsView({Key? key}) : super(key: key);

  @override
  State<YourQualificationsView> createState() => _YourQualificationsViewState();
}

class _YourQualificationsViewState extends State<YourQualificationsView> {
  String? degree;
  List<String> degreeList = <String>[
    "MBBS",
    "BAMS",
    "BHMS",
    "BDS.",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return OnBoardingPageViewsBodyWidget(
      children: [
        const LabelText(text: 'Graduation'),
        DropDownWidget(
          list: degreeList,
          select: degree,
          hint: 'Select your degree',
        ),
        const LabelText(text: 'Specialization (if applicable)'),
        const DropDownWidget(
          list: [],
          select: '',
          hint: 'Select your specialization',
        ),
        const LabelText(text: 'Super specialization (if applicable)'),
        DropDownWidget(
          list: [],
          select: '',
          hint: 'Select super specialization',
        ),

      ],
    );
  }
}
