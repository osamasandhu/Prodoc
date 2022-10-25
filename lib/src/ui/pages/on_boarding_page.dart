import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/welcome_page.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/area_of_practice.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/clinic_details.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_avatar.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_detail.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_qualification_view.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/logo_container.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/nav.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();

  int _page = 0;

  String pageTitle(int v) {
    switch (v) {
      case 0:
        return 'Your details';
      case 1:
        return 'Your qualification';
      case 2:
        return "Clinic's details ";
      case 3:
        return 'Area of practice';
      case 4:
        return 'Your avatar';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopLogoContainerWidget(),
            pageHeadRow(),
            Expanded(
              child: PageView(
                // physics: const BouncingScrollPhysics(),
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) => setState(() => _page = page),
                children:  const [
                  YourDetailsView(),
                  YourQualificationsView(),
                  ClinicDetailView(),
                  AreaOfPracticeView(),
                  YourAvatarView()
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: nextButtonWidget(),
      ),
    );
  }

  Widget pageHeadRow() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        right: 24,
        left: 24,
        bottom: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Font14Weight500Blue(text: pageTitle(_page), fontSize: 16),
          Font14Weight500Blue(
            text: 'STEP ${_page + 1}/5',
            fontSize: 10,
          ),
        ],
      ),
    );
  }

  Widget nextButtonWidget() {
    return BottomNavTextButtonWidget(
      onPressed: _page == 4
          ? () {
              AppNavigation.to(context, const WelcomePage());
            }
          : _nextView,
      text: _page == 4 ? 'Finish' : 'NEXT',
    );
  }

  void _nextView() => _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
}
