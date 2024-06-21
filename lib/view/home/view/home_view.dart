import 'package:assignment/src/app_strings.dart';
import 'package:assignment/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/common_widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text(AppStrings.home),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: Colors.white,
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonWidgets().commonTitleText(title: AppStrings.welcome),
              Obx(() => Text(controller.userName.value)),
              submitButtonView()
            ],
          ),
        ),
      ),
    );
  }

  Widget submitButtonView() {
    return CommonWidgets().commonSubmitButton(
        heading: AppStrings.signOut,
        onTap: () {
          controller.signOutFromGoogle();
        });
  }
}
