import 'package:assignment/src/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/app_strings.dart';
import '../../../src/common_widgets.dart';

class HomeController extends GetxController {
  RxString userName = "".obs;

  @override
  void onInit() {
    super.onInit();
    userName.value = Get.arguments[0]['userName'];
  }

  // function to sign out from google
  Future signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      userName.value = "";
      Get.offNamed(AppRoutes.registerView);
      CommonWidgets().showSnackBar(AppStrings.success, AppStrings.loggedOut);
    } on Exception catch (e) {
      CommonWidgets()
          .showSnackBar(AppStrings.alert, AppStrings.somethingWentWrong);

      debugPrint('exception->$e');
    }
  }
}
