import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/auth/otp_page.dart';
import 'package:prodoc/src/ui/widgets/auth_page_body.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _phone;
  final _formKey = GlobalKey<FormState>();
  final _autoValidateMode = AutovalidateMode.onUserInteraction;

  @override
  void initState() {
    super.initState();
    _phone = TextEditingController(text: '123456');
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageBody(
      richAuthButtonText: 'Sign up',
      pageName: 'Login',
      authButtonText: 'GET OTP',
      otpDescription: 'OTP would be sent on your registered phone number',
      authButtonOnTap: () {
        if (_formKey.currentState!.validate()) {
          AppNavigation.to(context, const OtpPage());
        } else {
          setState(() {});
        }
      },
      titleField: 'Phone Number',
      richButtonText: 'Already have an account? ',
       url: AppImages.worldHealthDay,
      child: formWidget(),
    );
  }

  Widget formWidget() {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: TextFormField(
        controller: _phone,
        keyboardType: TextInputType.number,
        validator: (v) {
          if (v!.isEmpty) {
            return 'Phone number is required';
          }
          return null;
        },
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
          prefixText: '+91  ',
          prefixStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
