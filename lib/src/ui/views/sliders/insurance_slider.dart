// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/page_view_widgets.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';
import 'package:prodoc/src/utils/images.dart';

class InsuranceSlider extends StatefulWidget {
  const InsuranceSlider({Key? key}) : super(key: key);

  @override
  State<InsuranceSlider> createState() => _InsuranceSliderState();
}

class _InsuranceSliderState extends State<InsuranceSlider> {
  final _insurancePageController =
  PageController(initialPage: 0, viewportFraction: 0.8);

  int _policiesCurrentPage= 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _insurancePageController,
        onPageChanged: (page) => setState(
              () => _policiesCurrentPage = page,
        ),
        itemBuilder: (c, i) {
          return InkWell(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.greenColor)),
                          child: Image.asset(AppImages.insurancePolicies),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Font14Weight400(
                                    text: 'Insurance provider name', fontSize: 10),
                                const SizedBox(
                                  height: 4,
                                ),
                                Font14Weight500Blue(
                                  text: 'Insurance name',
                                  textColor: AppColors.greenColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Expanded(
                                  child: Text(
                                    loremIpsum + loremIpsum,
                                    maxLines: 6,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ))),
          );
        },
      ),
    );
  }
}
