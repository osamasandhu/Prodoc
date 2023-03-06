// ignore_for_file: unused_field

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/hospital_page/hospital_blog_detail_page.dart';
import 'package:prodoc/src/ui/widgets/page_view_widgets.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class OurBlogSlider extends StatefulWidget {
  const OurBlogSlider({Key? key}) : super(key: key);

  @override
  State<OurBlogSlider> createState() => _OurBlogSliderState();
}

class _OurBlogSliderState extends State<OurBlogSlider> {
  int _blogsCurrentPage = 0;
  final _blogsPageController =
  PageController(initialPage: 0, viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _blogsPageController,
        onPageChanged: (page) => setState(
              () => _blogsCurrentPage = page,
        ),
        itemBuilder: (c, i) {
          return InkWell(
            onTap: () {
              AppNavigation.to(
                context,
                const HospitalBlogDetailPage(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedContainer(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        child: Image.asset(
                          AppImages.hospitalBlog,
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 20, right: 16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Font14Weight500Blue(
                              text: 'Conditions Treated with Arthroscopy',
                              textColor: AppColors.greenColor,
                            ),
                            Font14Weight400(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              text: 'August 10, 2022',
                              fontSize: 10,
                              textColor: AppColors.greyText,
                            ),
                            RichText(
                              text: TextSpan(
                                text: loremIpsum.length < 120
                                    ? loremIpsum + loremIpsum + loremIpsum
                                    : loremIpsum.substring(0, 120),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    height: 1.3,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    text: 'Know more',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
