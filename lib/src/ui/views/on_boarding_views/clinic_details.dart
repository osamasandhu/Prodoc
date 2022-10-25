import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_detail.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';

class ClinicDetailView extends StatefulWidget {
  const ClinicDetailView({Key? key}) : super(key: key);

  @override
  State<ClinicDetailView> createState() => _ClinicDetailViewState();
}

class _ClinicDetailViewState extends State<ClinicDetailView> {
  TextEditingController clinicController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OnBoardingPageViewsBodyWidget(
      children: [
        const LabelText(text: 'Clinic name *'),
        AppTextField(
          hint: 'Enter clinic name',
          textEditingController: clinicController,
        ),
        const LabelText(text: 'Pincode *'),
        AppTextField(
          hint: 'Enter pincode',
          textEditingController: pincodeController,
        ),
        const LabelText(text: 'Address'),
        AppTextField(
          hint: 'Enter address',
          textEditingController: addressController,
        ),
        const LabelText(text: 'Town/City'),
        AppTextField(
          hint: 'Enter town/city',
          textEditingController: cityController,
        ),
        const LabelText(text: 'State'),
        AppTextField(
          hint: 'Enter state',
          textEditingController: stateController,
        ),
        const LabelText(text: 'Country'),
        AppTextField(
          hint: 'Enter country',
          textEditingController: countryController,
        ),
      ],
    );
  }
}
