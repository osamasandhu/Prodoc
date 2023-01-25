import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/drop_down.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';
import 'package:prodoc/src/utils/app_utils.dart';

class YourDetailsView extends StatefulWidget {
  const YourDetailsView({Key? key}) : super(key: key);

  @override
  State<YourDetailsView> createState() => _YourDetailsViewState();
}

class _YourDetailsViewState extends State<YourDetailsView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  String? title;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return OnBoardingPageViewsBodyWidget(
      children: [
        const LabelText(text: 'Your title *'),
        DropDownWidget(
          list: DropDownListUtils.titleDropDownList,
          select: title,
          hint: 'Select your title',
        ),
        const LabelText(text: 'Name *'),
        AppTextField(
          textEditingController: nameController,
          hint: 'Enter your name',
        ),
        const LabelText(text: 'Gender *'),
        DropDownWidget(
          list: DropDownListUtils.titleDropDownList,
          select: gender,
          hint: 'Select your title',
        ),
        const LabelText(text: 'Email ID *'),
        AppTextField(
          textEditingController: emailController,
          keyboardType: TextInputType.emailAddress,
          hint: 'Enter your email id',
        ),
        const LabelText(text: 'Registration number '),
        AppTextField(
          hint: 'Enter your registration number',
          textEditingController: registrationController,
        ),
      ],
    );
  }
}

class OnBoardingPageViewsBodyWidget extends StatelessWidget {
  final List<Widget> children;
  final double? padding;

  const OnBoardingPageViewsBodyWidget(
      {Key? key, required this.children, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding:  EdgeInsets.all(padding??24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
