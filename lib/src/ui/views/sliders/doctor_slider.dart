import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/dialog_widget.dart';
import 'package:prodoc/src/ui/widgets/page_view_widgets.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';
import 'package:prodoc/src/utils/images.dart';

class DoctorSlider extends StatefulWidget {
  const DoctorSlider({Key? key}) : super(key: key);

  @override
  State<DoctorSlider> createState() => _DoctorSliderState();
}

class _DoctorSliderState extends State<DoctorSlider> {
  final _doctorPageController = PageController(initialPage: 0);
  int _doctorCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 35,
            ),
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _doctorPageController,
              onPageChanged: (page) => setState(
                () => _doctorCurrentPage = page,
              ),
              itemBuilder: (c, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: ElevatedContainer(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 94.15,
                            height: 94.15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.blueColor)),
                            child: Image.asset(AppImages.onlineDoctor),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: Font14Weight400(
                                    text: 'Lead Consultant', fontSize: 10),
                              ),
                              Expanded(
                                child: Font14Weight500Blue(
                                  text: 'Dr. Seema Deshmukh',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Expanded(
                                child: Font14Weight400(
                                  text: 'Lead Consultant',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Font14Weight400(
                                  text: 'Orthopedic',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )),
                        ],
                      )),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
        SliderDotsWidget(currentPage: _doctorCurrentPage, list: 10),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

class DoctorOfTheDaySlider extends StatefulWidget {
  const DoctorOfTheDaySlider({Key? key}) : super(key: key);

  @override
  State<DoctorOfTheDaySlider> createState() => _DoctorOfTheDaySliderState();
}

class _DoctorOfTheDaySliderState extends State<DoctorOfTheDaySlider> {
  final _doctorPageController = PageController(initialPage: 0);
  int _doctorCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 104,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _doctorPageController,
            onPageChanged: (page) => setState(
              () => _doctorCurrentPage = page,
            ),
            itemBuilder: (c, i) {
              return InkWell(
                onTap: () {
                  CustomPermissionDialog(
padding: EdgeInsets.zero,                    children: [
                      Image.asset(AppImages.hospitalBuilding),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Font14Weight400(
                              textColor: AppColors.greenColor,
                              text: 'Happy Doctor’s Day!',
                              fontWeight: FontWeight.w600,
                              padding: const EdgeInsets.only(bottom: 5),
                            ),
                            Font14Weight400(
                              fontSize: 10,
                              textColor: AppColors.greyText,
                              text: 'XYZ Hospital name',
                              fontWeight: FontWeight.w500,
                              padding: const EdgeInsets.only(bottom: 16),
                            ),
                            Font14Weight400(
                              text: loremIpsum + loremIpsum,
                            ),
                          ],
                        ),
                      )
                    ],
                  ).show(context);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: ElevatedContainer(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.greenColor)),
                          child: Image.asset(AppImages.hospitalBuilding),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Font14Weight500Blue(
                              text: 'Doctor’s Day!',
                              textColor: AppColors.greenColor,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Expanded(
                              child: Text(
                                loremIpsum +
                                    loremIpsum +
                                    loremIpsum +
                                    loremIpsum,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyText,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SliderDotsWidget(currentPage: _doctorCurrentPage, list: 5)
      ],
    );
  }
}
