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

  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final _focusNode4 = FocusNode();
  final _focusNode5 = FocusNode();
  final _focusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AuthPageBody(
      pageName: 'Enter OTP',
      titleField: 'Enter your OTP',
      otpDescription: 'OTP is sent on your registered phone number',
      authButtonText: 'Verify OTP',
      richAuthButtonText: 'Resend OTP',
      authButtonOnTap: () {
        AppNavigation.to(context, const OnBoardingPage());
      },
      richButtonText: 'Didn’t receive OTP? ',
      url: AppImages.onlineDoctor,
      child: otpFieldRow(),
    );
  }

  Widget otpFieldRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSingleText(
          textEditingController: _otpController1,
          current: _focusNode1,
          next: _focusNode2,
        ),
        _buildSingleText(
          textEditingController: _otpController2,
            current: _focusNode2,
            next: _focusNode3,
        ),
        _buildSingleText(
          textEditingController: _otpController3,
            current: _focusNode3,
            next: _focusNode4,
        ),
        _buildSingleText(
          textEditingController: _otpController4,
            current: _focusNode4,
            next: _focusNode5,
        ),
        _buildSingleText(
          textEditingController: _otpController5,
            current: _focusNode5,
            next: _focusNode6,
        ),
        _buildSingleText(
          textEditingController: _otpController6,
            current: _focusNode6,
            next: _focusNode6,
        ),
      ],
    );
  }

  Widget _buildSingleText({
    required TextEditingController textEditingController,
    required FocusNode current,
    required FocusNode next,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          focusNode: current,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          onChanged: (value) {
            if(value.length == 1) {
              FocusScope.of(context).requestFocus(next);
            }
          },
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
