import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/home_page/search_page.dart';
import 'package:prodoc/src/ui/views/sliders/doctor_slider.dart';
import 'package:prodoc/src/ui/views/sliders/media_slider.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/ui/widgets/text_field.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class BottomHomeView extends StatefulWidget {
  final VoidCallback onTapSent;
  final VoidCallback onTapReceived;

  const BottomHomeView(
      {Key? key, required this.onTapReceived, required this.onTapSent})
      : super(key: key);

  @override
  State<BottomHomeView> createState() => _BottomHomeViewState();
}

class _BottomHomeViewState extends State<BottomHomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: GestureDetector(
              onTap: () {
                AppNavigation.to(context, const SearchPage());
              },
              child: const AbsorbPointer(
                child: SearchTextField(
                  hint: 'Search for doctors, hospitals and more',
                ),
              ),
            ),
          ),
          topImagesList(),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 10, 24, 0),
            child: Font14Weight500Blue(
              text: 'Referral summary',
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                container(
                  t1: '15',
                  t2: 'Referrals sent',
                  onTap: widget.onTapSent,
                ),
                const SizedBox(width: 26),
                container(
                  t1: '18',
                  t2: 'Referrals received',
                  onTap: widget.onTapReceived,
                ),
              ],
            ),
          ),
          const MediaSlider(),
          const SizedBox(height: 72),
          const DoctorOfTheDaySlider(),
        ],
      ),
    );
  }

  Widget topImagesList() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.healthCard,
              width: 240,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget container({
    required String t1,
    required String t2,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.blueColor,
            ),
          ),
          child: Column(
            children: [
              Font14Weight500Blue(
                text: t1,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 10,
              ),
              Font14Weight500Blue(
                text: t2,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
