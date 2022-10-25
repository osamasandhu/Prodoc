import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/app_bar_widget.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';
import 'package:prodoc/src/utils/images.dart';

class HospitalBlogDetailPage extends StatefulWidget {
  const HospitalBlogDetailPage({Key? key}) : super(key: key);

  @override
  State<HospitalBlogDetailPage> createState() => _HospitalBlogDetailPageState();
}

class _HospitalBlogDetailPageState extends State<HospitalBlogDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Arthroscopy',
        backgroundColor: AppColors.greenColor,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(AppImages.hospitalBlog,fit: BoxFit.cover,),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Font14Weight400(
                    text: 'Conditions Treated with Arthroscopy',
                    textColor: AppColors.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                  const Font14Weight400(
                    text: 'August 10, 2022',
                    fontSize: 10,
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                  ),
                  Font14Weight400(
                    text: loremIpsum +
                        loremIpsum +
                        loremIpsum +
                        loremIpsum +
                        loremIpsum +
                        loremIpsum +
                        loremIpsum ,fontSize: 12,
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
