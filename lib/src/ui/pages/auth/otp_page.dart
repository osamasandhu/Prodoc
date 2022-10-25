import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prodoc/src/ui/pages/on_boarding_page.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

import '../../widgets/auth_page_body.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();
  final TextEditingController _otpController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthPageBody(
      pageName: 'Enter OTP',
      titleField: 'Enter your OTP',
      otpDescription: 'OTP is sent on your registered phone number',
      authButtonText: 'Verify OTP',
      richAuthButtonText: 'Resend OTP',
      authButtonOnTap: () {

        AppNavigation.to(context, const OnBoardingPage());},
      richButtonText: 'Didn’t receive OTP? ',
      url: AppImages.onlineDoctor,
      child: otpFieldRow(),
    );
  }

  Widget otpFieldRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSingleText(textEditingController: _otpController1),
        _buildSingleText(textEditingController: _otpController2),
        _buildSingleText(textEditingController: _otpController3),
        _buildSingleText(textEditingController: _otpController4),
        _buildSingleText(textEditingController: _otpController5),
        _buildSingleText(textEditingController: _otpController6),
      ],
    );
  }

  Widget _buildSingleText(
      {required TextEditingController textEditingController}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          textAlign: TextAlign.center,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          keyboardType: TextInputType.number,
          controller: textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            hintText: '-',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
          cursorColor: Colors.grey,
        ),
      ),
    );
  }
}
