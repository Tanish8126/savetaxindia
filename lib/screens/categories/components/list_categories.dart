import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../discussion_screen/discussion_screen.dart';
import '../../hire_expert_screen/hire_expert_screen.dart';
import '../../resources_screen/resources_screen.dart';
import '../../upload_file_screen/upload_file_screen.dart';

List<Map<String, dynamic>> categories = [
  {
    "icon": Icons.file_present_outlined,
    "text": "File ITR",
    "onpress": () {
      Get.toNamed(UploadFileScreen.routeName);
    },
  },
  {
    "icon": Icons.file_present_outlined,
    "text": "Discussion",
    "onpress": () {
      Get.toNamed(DiscussionScreen.routeName);
    },
  },
  {
    "icon": Icons.file_present_outlined,
    "text": "Resources",
    "onpress": () {
      Get.toNamed(ResourcesScreen.routeName);
    },
  },
  {
    "icon": Icons.file_present_outlined,
    "text": "Expert",
    "onpress": () {
      Get.toNamed(HireExpertScreen.routeName);
    },
  },
];
