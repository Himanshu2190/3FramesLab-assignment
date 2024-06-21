import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../src/app_routes.dart';
import '../../../src/app_strings.dart';
import '../../../src/common_widgets.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  // method to sign in with Google
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      debugPrint("Sign In Successful");
      Get.offNamed(AppRoutes.homeView,arguments:[
        {
          "userName": googleUser?.displayName
        },
      ] );
      CommonWidgets().showSnackBar(AppStrings.success, AppStrings.loggedIn);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      CommonWidgets().showSnackBar(AppStrings.alert, AppStrings.somethingWentWrong);
      debugPrint('exception->$e');
    }
  }
}
