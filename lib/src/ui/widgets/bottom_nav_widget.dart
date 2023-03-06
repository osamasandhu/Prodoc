import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/app_utils.dart';
import 'package:prodoc/src/utils/images.dart';

class BottomNavWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onChanged;
  final UserType userType;

  // final String? createManageTaskText;
  // final String? createManageTaskImage;
  const BottomNavWidget({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
    required this.userType, // this.createManageTaskImage,
    // this.createManageTaskText,
  }) : super(key: key);

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.white,
        onTap: widget.onChanged,
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: bottomNavImage(
              url: AppImages.homeLogo,
              i: 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: bottomNavImage(
              url: AppImages.referBottomLogo,
              i: 1,
            ),
            label: 'Referral',
          ),
          BottomNavigationBarItem(
            icon: bottomNavImage(
              url: AppSwitchCaseUtils.logoForCreateTaskManage(widget.userType),
              i: 2,
            ),
            label: AppSwitchCaseUtils.textForCreateTaskManage(widget.userType),
          ),
          BottomNavigationBarItem(
            icon: bottomNavImage(
              url: AppImages.communityLogo,
              i: 3,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: bottomNavImage(
              url: AppImages.servicesLogo,
              i: 4,
            ),
            label: 'Services',
          ),
        ],
      ),
    );
  }

  Widget bottomNavImage({required String url, required int i}) {
    return Image.asset(
      url,
      color: widget.currentIndex == i ? Colors.blue : null,
      width: 20,
      height: 20,
    );
  }
}
