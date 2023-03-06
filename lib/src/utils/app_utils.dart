import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/images.dart';

class DropDownListUtils {
  static List<String> titleDropDownList = <String>[
    "Doctor (Dr.)",
    "Ms.",
    "Mrs.",
    "Mr.",
  ];

  static List<String> genderDropDownList = <String>[
    "Female",
    "Male",
    "Other",
  ];

  static List<String> organizationTypeList = <String>[
    "Government institution",
    "Super-speciality hospital",
    "Multi-speciality hospital",
    "Single-speciality hospital",
    "Private clinic",
    "Labs/radiology center",
    "Medical educational institution",
    "Other",
  ];
  static List<String> degreeList = <String>[
    "MBBS",
    "BAMS",
    "BHMS",
    "BDS.",
    "Other",
  ];

  static List<String> cities = [
    'City A',
    'Town B',
    'City/town Abc',
    'Town I',
    'City/town xyz',
    'City E',
    'Town F',
    'City/town ghf',
    'Town h',
    'City/town faf',
  ];
  static List<String> selectedCities = [
    'City A',
    'City/town faf',
    'Town h',
  ];
}




class AppSwitchCaseUtils {
  static String appBar(int v, {UserType? userType}) {
    switch (v) {
      case 0:
        return 'Home';
      case 1:
        return 'Referral';
      case 2:
        return textForCreateTaskManage(userType!);
      case 3:
        return 'Community';
      case 4:
        return 'Services';
      default:
        return '';
    }
  }

  static Widget viewForCreateTaskManage(UserType v) {
    switch (v) {
      case UserType.create:
        return const Text('Create');
      case UserType.pro:
        return const Text('Pro');
      case UserType.admin:
        return const Text('Admin');
      default:
        return const SizedBox();
    }
  }

  static String textForCreateTaskManage(UserType v) {
    switch (v) {
      case UserType.create:
        return 'Create';
      case UserType.pro:
        return 'Task';
      case UserType.admin:
        return 'Manage';
      default:
        return '';
    }
  }

  static String logoForCreateTaskManage(UserType v) {
    switch (v) {
      case UserType.create:
        return AppImages.createReferLogo;
      case UserType.pro:
        return AppImages.taskLogo;
      case UserType.admin:
        return AppImages.manageLogo;
      default:
        return '';
    }
  }
}

enum UserType { create, pro, admin }
