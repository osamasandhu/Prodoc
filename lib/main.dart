import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodoc/src/ui/pages/hospital_page/hospital_profile_page.dart';
import 'package:prodoc/src/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppTheme.appBarTheme(),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const HospitalProfilePage(),
    );
  }
}
